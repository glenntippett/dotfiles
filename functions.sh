function load_alias() {
    if [ -f $1 ]; then
        source $1
    else
        print "404: $1 not found."
    fi
}
