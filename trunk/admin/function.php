<?php

/**
 * This is the shortcut to DIRECTORY_SEPARATOR
 */
defined('DS') or define('DS', DIRECTORY_SEPARATOR);

/**
 * This is the shortcut to Yii::app()
 */
function app() {
    return Yii::app();
}

/**
 * This is the shortcut to Yii::app()->theme->baseUrl
 */
function themeUrl() {
    return Yii::app()->theme->baseUrl;
}

/**
 * This is the shortcut to /media/
 */
function mediaUrl() {
    return Yii::app()->baseUrl . '/media/';
}

/**
 * This is the shortcut to Yii::app()->clientScript
 */
function cs() {
// You could also call the client script instance via Yii::app()->clientScript
// But this is faster
    return Yii::app()->getClientScript();
}

/**
 * This is the shortcut to Yii::app()->user.
 */
function user() {
    return Yii::app()->getUser();
}

/**
 * This is the shortcut to Yii::app()->createUrl()
 */
function url($route, $params = array(), $ampersand = '&') {
    return Yii::app()->createUrl($route, $params, $ampersand);
}

/**
 * This is the shortcut to CHtml::encode
 */
function h($text) {
    return htmlspecialchars($text, ENT_QUOTES, Yii::app()->charset);
}

/**
 * Set the key, value in Session
 * @param object $key
 * @param object $value
 * @return boolean 
 */
function setSession($key, $value) {
    return Yii::app()->getSession()->add($key, $value);
}

/**
 * Get the value from key in Session
 * @param object $key
 *
 * @return object
 */
function getSession($key) {
    return Yii::app()->getSession()->get($key);
}

/**
 * This is the shortcut to CHtml::link()
 */
function l($text, $url = '#', $htmlOptions = array()) {
    return CHtml::link($text, $url, $htmlOptions);
}

/**
 * This is the shortcut to Yii::t() with default category = 'stay'
 */
function t($message, $category = 'main', $params = array(), $source = null, $language = null) {
    return Yii::t($category, $message, $params, $source, $language);
}

/**
 * This is the shortcut to Yii::app()->request->baseUrl
 * If the parameter is given, it will be returned and prefixed with the app baseUrl.
 */
function bu($url = null) {
    static $baseUrl;
    if ($baseUrl === null)
	$baseUrl = Yii::app()->getRequest()->getBaseUrl();
    return $url === null ? $baseUrl : $baseUrl . '/' . ltrim($url, '/');
}

/**
 * This is the shortcut to domain
 */
function domain() {
    $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] && !in_array(strtolower($_SERVER['HTTPS']), array('off', 'no'))) ? 'https' : 'http';
    $url .= '://' . $_SERVER['HTTP_HOST'];
    return $url;
}

/**
 * Returns the named application parameter.
 * This is the shortcut to Yii::app()->params[$name].
 */
function param($name) {
    return Yii::app()->params[$name];
}

/**
 * Return the settings Component
 * @return type 
 */
function settings() {
    return Yii::app()->settings;
}

/**
 * var_dump($varialbe) and exit
 * 
 */
function dump($a) {
    var_dump($a);
    exit;
}

/**
 * Get extension of a file
 * 
 */
function getExt($filename) {
    return strtolower(substr(strrchr($filename, '.'), 1));
}

/**
 * Get the current IP of the connection
 * 
 */
function ip() {
    if (isset($_SERVER)) {
	if (isset($_SERVER['HTTP_CLIENT_IP'])) {
	    $ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif (isset($_SERVER['HTTP_FORWARDED_FOR'])) {
	    $ip = $_SERVER['HTTP_FORWARDED_FOR'];
	} elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
	    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
	    $ip = $_SERVER['REMOTE_ADDR'];
	}
    } else {
	if (getenv('HTTP_CLIENT_IP')) {
	    $ip = getenv('HTTP_CLIENT_IP');
	} elseif (getenv('HTTP_FORWARDED_FOR')) {
	    $ip = getenv('HTTP_FORWARDED_FOR');
	} elseif (getenv('HTTP_X_FORWARDED_FOR')) {
	    $ip = getenv('HTTP_X_FORWARDED_FOR');
	} else {
	    $ip = getenv('REMOTE_ADDR');
	}
    }
    return $ip;
}

function get_subfolders_name($path, $file = false) {

    $list = array();
    $results = scandir($path);
    foreach ($results as $result) {
	if ($result === '.' or $result === '..' or $result === '.svn')
	    continue;
	if (!$file) {
	    if (is_dir($path . '/' . $result)) {
		$list[] = trim($result);
	    }
	} else {
	    if (is_file($path . '/' . $result)) {
		$list[] = trim($result);
	    }
	}
    }

    return $list;
}

function hashPassword($password) {
    $salt = USER_SALT;
    return md5($password . $salt);
}

function stripVietnamese($str) {
    $unicode = array(
	'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
	'd' => 'đ',
	'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
	'i' => 'í|ì|ỉ|ĩ|ị',
	'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
	'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
	'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
	'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
	'D' => 'Đ',
	'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
	'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
	'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
	'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ứ|Ữ|Ự',
	'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
    );

    foreach ($unicode as $nonUnicode => $uni) {
	$str = preg_replace("/($uni)/i", $nonUnicode, $str);
    }
    return $str;
}

function clean($var) {
    return trim(strip_tags($var));
}

function fn_clean_input($data) {
    if (defined('QUOTES_ENABLED')) {
	$data = fn_strip_slashes_deep($data);
    }

    return $data;
}

function fn_strip_slashes_deep($data) {
    $data = is_array($data) ?
	    array_map('fn_strip_slashes_deep', $data) :
	    stripslashes($data);

    return $data;
}

function get_youtube_id($url, $need_curl = true) {
    $url_modified = strtolower(str_replace('www.', '', $url));
    if (strpos($url_modified, 'http://youtube.com') !== false) {
	parse_str(parse_url($url, PHP_URL_QUERY));

	/** end split the query string into an array* */
	if (!isset($v))
	    return false; //fast fail for links with no v attrib - youtube only

	if ($need_curl) {
	    $checklink = 'http://gdata.youtube.com/feeds/api/videos/' . $v;

//** curl the check link ***//
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_URL, $checklink);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
	    $result = curl_exec($ch);
	    curl_close($ch);

	    $return = $v;
	    if (trim($result) == "Invalid id")
		$return = false; //you tube response
	    return $return; //the stream is a valid youtube id.
	}

	return $v;
    }
    return false;
}

function stringURLSafe($string) {
// Remove any '-' from the string since they will be used as concatenaters
    $str = str_replace('-', ' ', $string);

//$lang = JFactory::getLanguage();
//$str = $lang->transliterate($str);
//Huy Ly added by 09/01/2011
// Hacked by vinaora.com
    $utf8characters = 'à|a, ả|a, ã|a, á|a, ạ|a, ă|a, ằ|a, ẳ|a, ẵ|a, ắ|a, ặ|a, â|a, ầ|a, ẩ|a, ẫ|a, ấ|a, ậ|a, đ|d, è|e, ẻ|e, ẽ|e, é|e, ẹ|e, ê|e, ề|e, ể|e, ễ|e, ế|e, ệ|e, ì|i, ỉ|i, ĩ|i, í|i, ị|i, ò|o, ỏ|o, õ|o, ó|o, ọ|o, ô|o, ồ|o, ổ|o, ỗ|o, ố|o, ộ|o, ơ|o, ờ|o, ở|o, ỡ|o, ớ|o, ợ|o, ù|u, ủ|u, ũ|u, ú|u, ụ|u, ư|u, ừ|u, ử|u, ữ|u, ứ|u, ự|u, ỳ|y, ỷ|y, ỹ|y, ý|y, ỵ|y, À|A, Ả|A, Ã|A, Á|A, Ạ|A, Ă|A, Ằ|A, Ẳ|A, Ẵ|A, Ắ|A, Ặ|A, Â|A, Ầ|A, Ẩ|A, Ẫ|A, Ấ|A, Ậ|A, Đ|D, È|E, Ẻ|E, Ẽ|E, É|E, Ẹ|E, Ê|E, Ề|E, Ể|E, Ễ|E, Ế|E, Ệ|E, Ì|I, Ỉ|I, Ĩ|I, Í|I, Ị|I, Ò|O, Ỏ|O, Õ|O, Ó|O, Ọ|O, Ô|O, Ồ|O, Ổ|O, Ỗ|O, Ố|O, Ộ|O, Ơ|O, Ờ|O, Ở|O, Ỡ|O, Ớ|O, Ợ|O, Ù|U, Ủ|U, Ũ|U, Ú|U, Ụ|U, Ư|U, Ừ|U, Ử|U, Ữ|U, Ứ|U, Ự|U, Ỳ|Y, Ỷ|Y, Ỹ|Y, Ý|Y, Ỵ|Y, "|, &|';
    $replacements = array();
    $items = explode(',', $utf8characters);
    foreach ($items as $item) {
	@list($src, $dst) = explode('|', trim($item));
	$replacements[trim($src)] = trim($dst);
    }
    $str = trim(strtr($str, $replacements));
// End Hack
// Trim white spaces at beginning and end of alias and make lowercase
    $str = trim(strtolower($str));

// Remove any duplicate whitespace, and ensure all characters are alphanumeric
    $str = preg_replace('/(\s|[^A-Za-z0-9\-])+/', '-', $str);

// Trim dashes at beginning and end of alias
    $str = trim($str, ' ');
    $str = trim($str, '-');

    return $str;
}

function stringSafe($string) {
// Remove any '-' from the string since they will be used as concatenaters
    $str = str_replace('-', ' ', $string);

//Huy Ly added by 09/01/2011
// Hacked by vinaora.com
    $utf8characters = 'à|a, ả|a, ã|a, á|a, ạ|a, ă|a, ằ|a, ẳ|a, ẵ|a, ắ|a, ặ|a, â|a, ầ|a, ẩ|a, ẫ|a, ấ|a, ậ|a, đ|d, è|e, ẻ|e, ẽ|e, é|e, ẹ|e, ê|e, ề|e, ể|e, ễ|e, ế|e, ệ|e, ì|i, ỉ|i, ĩ|i, í|i, ị|i, ò|o, ỏ|o, õ|o, ó|o, ọ|o, ô|o, ồ|o, ổ|o, ỗ|o, ố|o, ộ|o, ơ|o, ờ|o, ở|o, ỡ|o, ớ|o, ợ|o, ù|u, ủ|u, ũ|u, ú|u, ụ|u, ư|u, ừ|u, ử|u, ữ|u, ứ|u, ự|u, ỳ|y, ỷ|y, ỹ|y, ý|y, ỵ|y, À|A, Ả|A, Ã|A, Á|A, Ạ|A, Ă|A, Ằ|A, Ẳ|A, Ẵ|A, Ắ|A, Ặ|A, Â|A, Ầ|A, Ẩ|A, Ẫ|A, Ấ|A, Ậ|A, Đ|D, È|E, Ẻ|E, Ẽ|E, É|E, Ẹ|E, Ê|E, Ề|E, Ể|E, Ễ|E, Ế|E, Ệ|E, Ì|I, Ỉ|I, Ĩ|I, Í|I, Ị|I, Ò|O, Ỏ|O, Õ|O, Ó|O, Ọ|O, Ô|O, Ồ|O, Ổ|O, Ỗ|O, Ố|O, Ộ|O, Ơ|O, Ờ|O, Ở|O, Ỡ|O, Ớ|O, Ợ|O, Ù|U, Ủ|U, Ũ|U, Ú|U, Ụ|U, Ư|U, Ừ|U, Ử|U, Ữ|U, Ứ|U, Ự|U, Ỳ|Y, Ỷ|Y, Ỹ|Y, Ý|Y, Ỵ|Y, "|, &|';
    $replacements = array();
    $items = explode(',', $utf8characters);
    foreach ($items as $item) {
	@list($src, $dst) = explode('|', trim($item));
	$replacements[trim($src)] = trim($dst);
    }
    $str = trim(strtr($str, $replacements));
// End Hack
// Trim white spaces at beginning and end of alias and make lowercase
    $str = trim(strtolower($str));

// Remove any duplicate whitespace, and ensure all characters are alphanumeric
    $str = preg_replace('/(\s|[^A-Za-z0-9\-\.])+/', '-', $str);

// Trim dashes at beginning and end of alias
    $str = trim($str, ' ');
    $str = trim($str, '-');

    return $str;
}

function stringSafeFile($filename) {
    $ext = explode(".", $filename);
    return stringSafe(substr($filename, 0, strlen($filename) - strlen($ext[count($ext) - 1]))) . $ext[count($ext) - 1];
}

function getLengthMP3File($filename) {
    $fileMetadata = NULL;
    if (file_exists($filename)) {

	$file_info = new finfo(FILEINFO_MIME);
	$mime_type = $file_info->buffer(file_get_contents($filename));

	if ($mime_type == 'audio/mpeg; charset=binary') {
	    $mp3 = new mp3file($filename);
	    $metadata = $mp3->get_metadata();
	    $fileMetadata = $metadata;
	}
    }
    return $fileMetadata;
}

function setLanguage($lang = null) {
    if (isset($lang)) {
	if ($lang != 'en' &&
		$lang != 'vn') {
	    $lang = 'en';
	}
    } else {
	$lang = 'en';
    }
    if (!isset(Yii::app()->session['lang']) || Yii::app()->session['lang'] != $lang) {
	Yii::app()->session['lang'] = $lang;
    }
    Yii::app()->setLanguage($lang);
}

function sendMail($email_to, $email_body, $email_subject = null, $sender_name = null, $email_from = null) {
    ob_start();
    $from = $email_from == null ? Yii::app()->params['email']['sender'] : $email_from;
    $name = $sender_name == null ? Yii::app()->params['email']['name'] : $sender_name;
    $subject = $email_subject == null ? Yii::app()->params['email']['subject'] : $email_subject;

    $headers = array(
	"From: " . $name . "<" . $from . ">",
	'MIME-Version: 1.0',
	'Content-type: text/html; charset=utf-8',
    );

    return Yii::app()->email->send($from, $email_to, $subject, $email_body, $headers);
}

function call_api($url) {
    $agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_7) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.112 Safari/534.30';

    $options = array(
	CURLOPT_RETURNTRANSFER => true, // return web page if successful
	CURLOPT_HEADER => false, // don't return headers
	CURLOPT_FOLLOWLOCATION => true, // follow redirects
	CURLOPT_ENCODING => "", // handle all encodings
	CURLOPT_USERAGENT => $agent, // who am i
	CURLOPT_AUTOREFERER => true, // set referer on redirect
	CURLOPT_CONNECTTIMEOUT => 120, // timeout on connect
	CURLOPT_TIMEOUT => 120, // timeout on response
	CURLOPT_MAXREDIRS => 10, // stop after 10 redirects
	CURLOPT_SSL_VERIFYPEER => false, // Disabled SSL Cert checks
	CURLOPT_SSL_VERIFYHOST => false, // Disable host checks ?
    );

    $ch = curl_init($url);
    curl_setopt_array($ch, $options);
    $result = curl_exec($ch);
    curl_close($ch);

    return $result;
}

function genUniqueCode() {
    return uniqid(md5(gmdate('YmdGis') . USER_SALT));
}

function _make_url_clickable_cb($matches) {
    $ret = '';
    $url = $matches[2];
    if (empty($url))
	return $matches[0];
// removed trailing [.,;:] from URL
    if (in_array(substr($url, -1), array('.', ',', ';', ':')) === true) {
	$ret = substr($url, -1);
	$url = substr($url, 0, strlen($url) - 1);
    }
    return $matches[1] . "<a href=\"$url\" target=\"_blank\" rel=\"nofollow\">$url</a>" . $ret;
}

function _make_web_ftp_clickable_cb($matches) {
    $ret = '';
    $dest = $matches[2];
    $dest2 = 'http://' . $dest;

    if (empty($dest))
	return $matches[0];
// removed trailing [,;:] from URL
    if (in_array(substr($dest, -1), array('.', ',', ';', ':')) === true) {
	$ret = substr($dest, -1);
	$dest = substr($dest, 0, strlen($dest) - 1);
    }
    return $matches[1] . "<a href=\"$dest2\" target=\"_blank\" rel=\"nofollow\">$dest</a>" . $ret;
}

function make_clickable($ret) {
    $ret = ' ' . $ret;
// in testing, using arrays here was found to be faster
    $ret = preg_replace_callback('#([\s>])([\w]+?://[\w\\x80-\\xff\#$%&~/.\-;:=,?@\[\]+]*)#is', '_make_url_clickable_cb', $ret);
    $ret = preg_replace_callback('#([\s>])((www|ftp)\.[\w\\x80-\\xff\#$%&~/.\-;:=,?@\[\]+]*)#is', '_make_web_ftp_clickable_cb', $ret);

// this one is not in an array because we need it to run last, for cleanup of accidental links within links
    $ret = preg_replace("#(<a( [^>]+?>|>))<a [^>]+?>([^>]+?)</a></a>#i", "$1$3</a>", $ret);
    $ret = trim($ret);
    return $ret;
}

/**
 * @author Kien Tran <kien.tran@loggiear.com>
 * Strip HTML and PHP tags from a string. If $invert is TRUE, return a string which is be removed $tags tag name, else return a string which is included $tags tag name
 * @param type $text
 * @param type $tags tag names (example: <script> <p>)
 * @param type $invert
 * @return type string
 */
function strip_tags_content($text, $tags = '', $invert = FALSE) {

    preg_match_all('/<(.+?)[\s]*\/?[\s]*>/si', trim($tags), $tags);
    $tags = array_unique($tags[1]);

    if (is_array($tags) AND count($tags) > 0) {
	if ($invert == FALSE) {
	    return preg_replace('@<(?!(?:' . implode('|', $tags) . ')\b)(\w+)\b.*?>.*?</\1>@si', '', $text);
	} else {
	    return preg_replace('@<(' . implode('|', $tags) . ')\b.*?>.*?</\1>@si', '', $text);
	}
    } elseif ($invert == FALSE) {
	return preg_replace('@<(\w+)\b.*?>.*?</\1>@si', '', $text);
    }
    return $text;
}

function ImageCreateFromBMP($filename) {
//Ouverture du fichier en mode binaire
    if (!$f1 = fopen($filename, "rb"))
	return FALSE;

//1 : Chargement des ent�tes FICHIER
    $FILE = unpack("vfile_type/Vfile_size/Vreserved/Vbitmap_offset", fread($f1, 14));
    if ($FILE['file_type'] != 19778)
	return FALSE;

//2 : Chargement des ent�tes BMP
    $BMP = unpack('Vheader_size/Vwidth/Vheight/vplanes/vbits_per_pixel' .
	    '/Vcompression/Vsize_bitmap/Vhoriz_resolution' .
	    '/Vvert_resolution/Vcolors_used/Vcolors_important', fread($f1, 40));
    $BMP['colors'] = pow(2, $BMP['bits_per_pixel']);
    if ($BMP['size_bitmap'] == 0)
	$BMP['size_bitmap'] = $FILE['file_size'] - $FILE['bitmap_offset'];
    $BMP['bytes_per_pixel'] = $BMP['bits_per_pixel'] / 8;
    $BMP['bytes_per_pixel2'] = ceil($BMP['bytes_per_pixel']);
    $BMP['decal'] = ($BMP['width'] * $BMP['bytes_per_pixel'] / 4);
    $BMP['decal'] -= floor($BMP['width'] * $BMP['bytes_per_pixel'] / 4);
    $BMP['decal'] = 4 - (4 * $BMP['decal']);
    if ($BMP['decal'] == 4)
	$BMP['decal'] = 0;

//3 : Chargement des couleurs de la palette
    $PALETTE = array();
    if ($BMP['colors'] < 16777216) {
	$PALETTE = unpack('V' . $BMP['colors'], fread($f1, $BMP['colors'] * 4));
    }

//4 : Cr�ation de l'image
    $IMG = fread($f1, $BMP['size_bitmap']);
    $VIDE = chr(0);

    $res = imagecreatetruecolor($BMP['width'], $BMP['height']);
    $P = 0;
    $Y = $BMP['height'] - 1;
    while ($Y >= 0) {
	$X = 0;
	while ($X < $BMP['width']) {
	    if ($BMP['bits_per_pixel'] == 24)
		$COLOR = unpack("V", substr($IMG, $P, 3) . $VIDE);
	    elseif ($BMP['bits_per_pixel'] == 16) {
		$COLOR = unpack("n", substr($IMG, $P, 2));
		$COLOR[1] = $PALETTE[$COLOR[1] + 1];
	    } elseif ($BMP['bits_per_pixel'] == 8) {
		$COLOR = unpack("n", $VIDE . substr($IMG, $P, 1));
		$COLOR[1] = $PALETTE[$COLOR[1] + 1];
	    } elseif ($BMP['bits_per_pixel'] == 4) {
		$COLOR = unpack("n", $VIDE . substr($IMG, floor($P), 1));
		if (($P * 2) % 2 == 0)
		    $COLOR[1] = ($COLOR[1] >> 4);
		else
		    $COLOR[1] = ($COLOR[1] & 0x0F);
		$COLOR[1] = $PALETTE[$COLOR[1] + 1];
	    }
	    elseif ($BMP['bits_per_pixel'] == 1) {
		$COLOR = unpack("n", $VIDE . substr($IMG, floor($P), 1));
		if (($P * 8) % 8 == 0)
		    $COLOR[1] = $COLOR[1] >> 7;
		elseif (($P * 8) % 8 == 1)
		    $COLOR[1] = ($COLOR[1] & 0x40) >> 6;
		elseif (($P * 8) % 8 == 2)
		    $COLOR[1] = ($COLOR[1] & 0x20) >> 5;
		elseif (($P * 8) % 8 == 3)
		    $COLOR[1] = ($COLOR[1] & 0x10) >> 4;
		elseif (($P * 8) % 8 == 4)
		    $COLOR[1] = ($COLOR[1] & 0x8) >> 3;
		elseif (($P * 8) % 8 == 5)
		    $COLOR[1] = ($COLOR[1] & 0x4) >> 2;
		elseif (($P * 8) % 8 == 6)
		    $COLOR[1] = ($COLOR[1] & 0x2) >> 1;
		elseif (($P * 8) % 8 == 7)
		    $COLOR[1] = ($COLOR[1] & 0x1);
		$COLOR[1] = $PALETTE[$COLOR[1] + 1];
	    }
	    else
		return FALSE;
	    imagesetpixel($res, $X, $Y, $COLOR[1]);
	    $X++;
	    $P += $BMP['bytes_per_pixel'];
	}
	$Y--;
	$P+=$BMP['decal'];
    }

//Fermeture du fichier
    fclose($f1);

    return $res;
}




/**
 * Read a file and display its content chunk by chunk
 * * Note: Must set implicit_flush to on in php.ini
 * @param type $filename
 * @param type $retbytes
 * @return boolean
 */
function readfile_chunked($filename, $retbytes = TRUE) {
    $buffer = '';
    $cnt = 0;
// $handle = fopen($filename, 'rb');
    $handle = fopen($filename, 'rb');
    if ($handle === false) {
	return false;
    }
    while (!feof($handle)) {
	$buffer = fread($handle, 10 *1024 * 1024);
	echo $buffer;
	ob_flush();
	flush();
	if ($retbytes) {
	    $cnt += strlen($buffer);
	}
    }
    $status = fclose($handle);
    if ($retbytes && $status) {
	return $cnt; // return num. bytes delivered like readfile() does.
    }
    return $status;
}

class Encryption {

    private static $skey = "cms";

    public static function safe_b64encode($string) {
	$data = base64_encode($string);
	$data = str_replace(array('+', '/', '='), array('-', '_', ''), $data);
	return $data;
    }

    public static function safe_b64decode($string) {
	$data = str_replace(array('-', '_'), array('+', '/'), $string);
	$mod4 = strlen($data) % 4;
	if ($mod4) {
	    $data .= substr('====', $mod4);
	}
	return base64_decode($data);
    }

    public static function encode($value) {
	if (!$value) {
	    return false;
	}
	$text = $value;
	$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
	$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
	$crypttext = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, Encryption::$skey, $text, MCRYPT_MODE_ECB, $iv);
	return trim(Encryption::safe_b64encode($crypttext));
    }

    public static function decode($value) {
	if (!$value) {
	    return false;
	}
	$crypttext = Encryption::safe_b64decode($value);
	$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
	$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
	$decrypttext = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, Encryption::$skey, $crypttext, MCRYPT_MODE_ECB, $iv);
	return trim($decrypttext);
    }

}

function cmp($a, $b) {
    return $a->display_order > $b->display_order;
}

function compare_objects($obj_a, $obj_b) {
    $isSame = $obj_a->id == $obj_b->id ? 0 : 1;

    return $isSame;
}