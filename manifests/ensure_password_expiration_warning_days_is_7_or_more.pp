# @api private
#  Ensure password expiration warning days is 7 or more (Scored)
#
# Description:
# The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined
# number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days.
#
# Rationale:
# Providing an advance warning that a password will be expiring gives users time to think of a secure password. Users caught unaware may
# choose a simple password or write it down where it may be discovered.
#
# @summary  Ensure password expiration warning days is 7 or more (Scored)
#
class secure_linux_cis::rules::ensure_password_expiration_warning_days_is_7_or_more {

  file_line { 'password warning policy':
    ensure => present,
    path   => '/etc/login.defs',
    line   => "PASS_WARN_AGE 7",
    match  => '^#?PASS_WARN_AGE',
  }
  # local_users fact may be undef
 # $local_users = pick($facts['local_users'], {})
  #$local_users.each |String $user, Hash $attributes| {
  #  if $attributes['password_expires_days'] != 'never' and
  #  $attributes['warn_days_between_password_change'] != $secure_linux_cis::pass_warn_days {
  #    exec { "/usr/bin/chage --warndays ${secure_linux_cis::pass_warn_days} ${user}": }
  #  }
  #}
}
