node 'demo' {
  include nginx
  include git
}

node 'demo2' {
  include nginx
}

node 'demo3' {
  include nginx
}
