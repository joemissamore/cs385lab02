package main

import (
	"fmt"
	"minibank/handlers"
	"minibank/models"
	"net/http"
	"os"
)

func main() {
	// Connect to the database
	dbConn := fmt.Sprintf("minibank:minibank@(172.0.0.5)/minibank")
	fmt.Printf(dbConn)
	models.InitDB(dbConn)
	defer models.Database.Close()
	http.HandleFunc("/api/account/register", handlers.RegisterHandler)
	// http.HandleFunc("/api/account/token", handlers.TokenHandler)
	http.ListenAndServe(port(), nil)
}

func port() string {
	port := os.Getenv("PORT")
	if len(port) == 0 {
		port = "8080"
	}
	return ":" + port
}
