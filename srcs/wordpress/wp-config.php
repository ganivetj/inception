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
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         'SU+3Nu%Yoiys7N}+|nUOKWhWg~Qo]FKpz@Yu)U|+k?>b:aJh9}2J0Il@*u~>d4gf');
define('SECURE_AUTH_KEY',  '6(TKD^I}&[w9vYnUZ.Vm#O5IKC-^C:4;Sa|9Tush-%2-;em^V9W=WUs]Fa5*$fa@');
define('LOGGED_IN_KEY',    'T v#i=,9H!-TiYz8J78iu;i)<C{?UB|@;~>AY,x}OJ|>16SY)|gXa<nZR6u7B-iK');
define('NONCE_KEY',        'v7*le^/Fdqpne>npSENh.e5~&8Jdif-BNXP!|fSwh7!sVlotMe;Ry06/jf,c+-QC');
define('AUTH_SALT',        'R+kT$Ids J0q |KW J.A>AJ4gTSDRO~YLAW]|$WU` +Q+9}$siYqMat[+4nk}-FP');
define('SECURE_AUTH_SALT', 'sPiU@lT?4/_CXGOZK$}Z}Z`?+)Priq-Os=%cL*u6vYj*<xDt/P/~Qc#8L&yU3VW?');
define('LOGGED_IN_SALT',   'Bwy?!e<R@KbGEe^9Z`w~ixv`LgIt[zQw@ZMRUgk&uk^ kN+nIzl+/Q,&/&yjALxf');
define('NONCE_SALT',       ':9oYFfNc@f`|0@#5S;yqiF 1u)30/~ zHQnW)R~q>|Tg<0ICH^ thM5;<}T6}AXn');

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