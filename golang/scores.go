package main
import (
    "fmt"
    "strings"
    "log"
    "net/http"
    "os"
    "io/ioutil"
    xj "github.com/basgys/goxml2json"
)
func getXML(url string) (string, error) {
    resp, err := http.Get(url)
    if err != nil {
        return "", fmt.Errorf("GET error: %v", err)
    }
    defer resp.Body.Close()

    if resp.StatusCode != http.StatusOK {
        return "", fmt.Errorf("Status error: %v", resp.StatusCode)
    }

    data, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        return "", fmt.Errorf("Read body: %v", err)
    }

    return string(data), nil
}

func handler(w http.ResponseWriter, r *http.Request) {
    var score_url = "https://www.scorespro.com/rss2/live-baseball.xml"

    if xml_string, err := getXML(score_url); err != nil {
        fmt.Fprintf(w, "failed to get scores: %v", err)
    } else {
        xml := strings.NewReader(xml_string)
        json, err := xj.Convert(xml)
        if err != nil {
            fmt.Fprintf(w, "failed to convert xml to json: %v", err)
        } else {
            fmt.Fprintf(w, json.String())
        }
    }
}

func main() {
    http.HandleFunc("/scores", handler)
    fmt.Println("Starting Restful services...")
    fmt.Println("Using port:8080")
    err := http.ListenAndServe(":8080", nil)
    log.Print(err)
    errorHandler(err)
}

func errorHandler(err error){
if err!=nil {
    fmt.Println(err)
    os.Exit(1)
}
}