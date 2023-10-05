<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'wp_password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '^ ?Apm)=$=jKyViF,qMZ>h@BSJ#v!zu0* |%RfN-<7(Sqfo JVA<<AWrTGsen?^<' );
define( 'SECURE_AUTH_KEY',  '(r)u{3a Y!UIYLoO>#&=mS2Xl8@x#%-hEiuDhHhr{qUZ(J];<1#*I.yCC$n)[!eu' );
define( 'LOGGED_IN_KEY',    'K|]Z:W$a;-Xi>1JiXY@%t]Pj#N:ppU),u|~caKq,6/3?1?18T}fxXFGgHgjx*}/S' );
define( 'NONCE_KEY',        ')Rc5SAreWp *e]H>F.~8a?Tg_2BH,>4Mu@J7=oerpAZoGI8]4K A0+Q#R(v~!Mwv' );
define( 'AUTH_SALT',        'p?5#Tg;1xU+vjCqazpgbQEzA*_>dODZ&Os*ZwJ?Zqv{u}aI92#tXF@#3]L}8hDVt' );
define( 'SECURE_AUTH_SALT', '16ppx59A]0|F/!M@,9$v.JX(,8+a!+$@V<ywH^!ZpJU7D(#nZ:vRqVUz[[EkH(s#' );
define( 'LOGGED_IN_SALT',   '$9p;*bi/r&X7_ecph`;[^h+nxaLN?e&w5,b/LYvM;xV~}D}! u/eu>XF`p1D2shq' );
define( 'NONCE_SALT',       'iStpIO)gX+CDYpmuO*SWd/a4+78MlfpAA<jKT`?p)#.~ito.W+`.u$]t7+1JPK6*' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';