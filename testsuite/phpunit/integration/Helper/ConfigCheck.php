<?php

namespace Upg\Prestashop\Integration\Helper;

class ConfigCheck
{
    public $dbHost;
    public $dbPort;
    public $dbName;
    public $dbUserName;
    public $dbPassword;
    public $siteBaseUrl;
    public $dbPrefix = '';

    private $processTest;

    /**
     * Check if environment variables are set
     */
    public function __construct()
    {
        $this->dbHost = trim(getenv('UPG_PRESTASHOP_DBHOST'));
        $this->dbPort = trim(getenv('UPG_PRESTASHOP_PORT'));
        $this->dbUserName = trim(getenv('UPG_PRESTASHOP_USER_NAME'));
        $this->dbPassword = trim(getenv('UPG_PRESTASHOP_PASSWORD'));
        $this->siteBaseUrl = trim(getenv('UPG_PRESTASHOP_SITE_BASE_URL'));
        $this->dbName = trim(getenv('UPG_PRESTASHOP_DBNAME'));
        $this->dbPrefix = trim(getenv('UPG_PRESTASHOP_DBPREFIX'));

        if(
            empty($this->dbHost) &&
            empty($this->dbPort) &&
            empty($this->dbUserName) &&
            empty($this->dbPassword) &&
            empty($this->siteBaseUrl) &&
            empty($this->dbName)
        ) {
            $this->processTest = false;
        }else{
            $this->processTest = true;
        }
    }

    public function skipTest()
    {
        return !$this->processTest;
    }

    public function getTableName($nameWithOutPrefix)
    {
        return $this->dbPrefix.$nameWithOutPrefix;
    }
}
