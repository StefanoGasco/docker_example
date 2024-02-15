import http.server
import socketserver

PORT = 8000

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"<html><body><h1>Hello, World!!!!!!!</h1></body></html>")

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print("Local website running at http://localhost:{}/".format(PORT))
    httpd.serve_forever()