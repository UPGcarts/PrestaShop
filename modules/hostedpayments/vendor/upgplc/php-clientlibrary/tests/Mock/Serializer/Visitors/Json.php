<?php

namespace Upg\Library\Tests\Mock\Serializer\Visitors;

use Upg\Library\Serializer\Visitors\VisitorInterface as VisitorInterface;
use Upg\Library\Request\RequestInterface as RequestInterface;
use Upg\Library\Serializer\Serializer as Serializer;

class Json implements VisitorInterface
{
    /**
     * The method by which the object is visited and is serialized
     * For the mock object I will simply return an preformatted json string
     * @param RequestInterface $object
     * @param Serializer $serializer
     * @return string Returns a formatted string such as json, post data from the object
     * @throws \Upg\Library\AbstractException Should throw exception if there is an error
     */
    public function visit(RequestInterface $object, Serializer $serializer)
    {
        return '{"testa": 1}';
    }

    /**
     * Returns the datatype the visitor outputs such as xml,json or post form
     * @return string
     */
    public function getType()
    {
        return 'json';
    }
}
