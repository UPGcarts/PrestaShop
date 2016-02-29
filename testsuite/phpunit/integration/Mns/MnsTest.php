<?php

namespace Upg\Prestashop\Integration\Mns;

class MnsTest extends \PHPUnit_Framework_TestCase
{
    /**
     * @var \Upg\Prestashop\Integration\Helper\ConfigCheck
     */
    private $config;

    /**
     * @var \PDO
     */
    private $dbHandle;

    protected function setUp()
    {
        $this->config = new \Upg\Prestashop\Integration\Helper\ConfigCheck();

        $pdoString = "mysql:host={$this->config->dbHost};dbname={$this->config->dbName};port={$this->config->dbPort}";

        $this->dbHandle = new \PDO($pdoString, $this->config->dbUserName, $this->config->dbPassword);

        $updateSql = 'UPDATE '
            .$this->config->getTableName('configuration')
            .' SET value = "P1F9O3OFTIOM32WP" WHERE name="PAYCO_PASSWORD"';


        $this->dbHandle->query($updateSql);

    }

    public function testSuccessfulPost()
    {
        if($this->config->skipTest()) {
            $this->markTestIncomplete('Config is not setup for test');
            return;
        }

        $data = array(
            'merchantID' => 1,
            'storeID' => 2,
            'orderID' => 3,
            'captureID' => 4,
            'merchantReference' => 5,
            'paymentReference' => 6,
            'userID' => 7,
            'amount' => 9,
            'currency' => 10,
            'transactionStatus' => 12,
            'orderStatus' => 13,
            'additionalData' => 15,
            'timestamp' => 16,
            'version' => 1.5,
            'mac' => 'f358f8c328a624b99b8c0a8d1e981c958a8930a0',
        );

        $url = $this->getMnsUrl();
        $ch = curl_init($this->getMnsUrl());
        $ch = $this->setCurlStandardOptions($ch);

        curl_setopt($ch,CURLOPT_POST, count($data));
        curl_setopt($ch,CURLOPT_POSTFIELDS, $data);

        $cookie = "XDEBUG_SESSION=XDEBUG_ECLIPSE";
        $headers[] = 'Cookie: ' . $cookie;
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $output = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        $this->assertContains($httpCode, array('100','200'));
    }

    public function testMnsMacError()
    {
        if($this->config->skipTest()) {
            $this->markTestIncomplete('Config is not setup for test');
            return;
        }

        $data = array(
            'merchantID' => urlencode(1),
            'storeID' => urlencode(2),
            'orderID' => urlencode(3),
            'captureID' => urlencode(4),
            'merchantReference' => urlencode(5),
            'paymentReference' => urlencode(6),
            'userID' => urlencode(7),
            'amount' => urlencode(9),
            'currency' => urlencode(10),
            'transactionStatus' => urlencode(12),
            'orderStatus' => urlencode(13),
            'additionalData' => urlencode(15),
            'timestamp' => urlencode(16),
            'version' => urlencode(1.5),
            'mac' => urlencode('fbdc46ef7ab1ccf195781983caf60782a81bb1e2')
        );



        $ch = curl_init($this->getMnsUrl());
        $ch = $this->setCurlStandardOptions($ch);

        curl_setopt($ch,CURLOPT_POST, count($data));
        curl_setopt($ch,CURLOPT_POSTFIELDS, $data);

        $output = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        $this->assertEquals(500, $httpCode, '500 not being sent got '.$httpCode.' instead');
    }

    public function testNoPostSent()
    {
        if($this->config->skipTest()) {
            $this->markTestIncomplete('Config is not setup for test');
            return;
        }

        $ch = curl_init($this->getMnsUrl());
        $ch = $this->setCurlStandardOptions($ch);

        $output = curl_exec($ch);

        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        $this->assertEquals(400, $httpCode, '400 not being sent got '.$httpCode.' instead');
    }

    private function getMnsUrl()
    {
        return $this->config->siteBaseUrl.'/module/payco/mns';
    }

    /**
     * @param $ch
     * @return resource
     */
    private function setCurlStandardOptions($ch)
    {
        curl_setopt($ch, CURLOPT_HEADER, true);    // we want headers
        curl_setopt($ch, CURLOPT_NOBODY, true);    // we don't need body
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch, CURLOPT_TIMEOUT,10);

        return $ch;
    }
}