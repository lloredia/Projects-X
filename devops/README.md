# DevOps 




## web-servers
================================================================

### Run a basic http server, great for serving up shells etc
```python -m SimpleHTTPServer 8000```

### Run a basic Python3 http server, great for serving up shells etc
```python3 -m http.server```

### Run a ruby webrick basic http server
```ruby -rwebrick -e "WEBrick::HTTPServer.new(:Port => 80, :DocumentRoot => Dir.pwd).start"```

### Run a basic PHP http server
```php -S 0.0.0.0:80```
