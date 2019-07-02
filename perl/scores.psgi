use LWP;
use LWP::UserAgent;
use JSON::XS;
use XML::XML2JSON;
use LWP::Simple;
use Symbol::Move ('&get' => 'url_get'); # such a hack because both LWP::Simple and Mojolicious want to put 'get' into &main::get
use Mojolicious::Lite;

my $ua = new LWP::UserAgent;
$ua->agent("MAS::UserAgent:v1.0");
$ua->env_proxy;

helper xml_as_json => sub {
    my ($self, $xml) = @_;

    my $xml2json = XML::XML2JSON->new(
        module => 'JSON::XS',
        pretty => 'true'
    );

    my $json = $xml2json->convert( $xml );

    return $json;
};

get '/scores' => sub {
    my ($self) = shift;

    my $xml = url_get('https://www.scorespro.com/rss2/live-baseball.xml');

    $self->res->headers->header('Content-type' => 'application/json; charset=utf-8');
    return $self->render(text => $self->xml_as_json($xml));
};

app->start;
