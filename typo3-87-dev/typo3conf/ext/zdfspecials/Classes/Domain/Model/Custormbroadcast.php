<?php
namespace TYPO3\Zdfspecials\Domain\Model;
/***************************************************************
*  Copyright notice
*
*  (c) 2011 Thomas Mammitzsch <mammitzsch.t@zdf.de>, visualworx
*
*  All rights reserved
*
*  This script is part of the TYPO3 project. The TYPO3 project is
*  free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 3 of the License, or
*  (at your option) any later version.
*
*  The GNU General Public License can be found at
*  http://www.gnu.org/copyleft/gpl.html.
*
*  This script is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  This copyright notice MUST APPEAR in all copies of the script!
***************************************************************/

/**
 * Special
 */
class Custombroadcast extends \TYPO3\CMS\Extbase\DomainObject\AbstractEntity {

    /**
     * name
     * @var \DateTime
     */
    protected $broadcastDate;

    /**
     * title
     * @var string
     */
    protected $title;

    /**
	 * abstract
	 *
	 * @var string
	 */
	protected $abstract;

    /**
	 * category
	 *
	 * @var string
	 */
	protected $category;

    /**
     * @return \DateTime
     */
    public function getBroadcastDate()
    {
        return $this->broadcastDate;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @return string
     */
    public function getAbstract()
    {
        return $this->abstract;
    }

    /**
     * @return string
     */
    public function getCategory()
    {
        return $this->category;
    }

}
?>