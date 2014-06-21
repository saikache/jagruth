$stdout.sync = true

use Rack::Static,
  :urls => ["/assets/css", "/assets/js", "/assets/img", "/assets/spec", "/assets/images", "/assets/font"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}

