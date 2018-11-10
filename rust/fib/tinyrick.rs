//! Build configuration

extern crate tinyrick;
extern crate tinyrick_extras;

/// Generate documentation
fn doc() {
    tinyrick_extras::doc();
}

/// Run clippy
fn clippy() {
    tinyrick_extras::clippy();
}

/// Validate documentation and run linters
fn lint() {
    tinyrick::deps(doc);
    tinyrick::deps(clippy);
}

/// Install binaries
fn install() {
    tinyrick_extras::install_binaries();
}

/// Uninstall binaries
fn uninstall() {
    tinyrick_extras::uninstall_binaries();
}

/// Doc, lint, and run unit tests
fn unit_test() {
    tinyrick::deps(lint);
    tinyrick_extras::unit_test();
}

/// Doc, lint, and run integration tests
fn integration_test() {
    tinyrick::deps(lint);
    tinyrick::deps(install);

    tinyrick::exec!("fib");
}

/// Doc, lint, and run tests
fn test() {
    tinyrick::deps(unit_test);
    tinyrick::deps(integration_test);
}

/// Doc, lint, test, and compile
fn build() {
    tinyrick::deps(test);
    tinyrick_extras::build();
}

/// Publish to crate repository
fn publish() {
    tinyrick_extras::publish();
}

/// Clean workspaces
fn clean() {
    tinyrick_extras::clean_cargo();
}

/// CLI entrypoint
fn main() {
    tinyrick::phony!(clean);

    tinyrick::wubba_lubba_dub_dub!(
        build;
        doc,
        clippy,
        lint,
        install,
        uninstall,
        unit_test,
        integration_test,
        test,
        publish,
        clean
    );
}
