<?xml version="1.0" ?>
<!--
 Licensed to the Apache Software Foundation (ASF) under one   *
 or more contributor license agreements.  See the NOTICE file *
 distributed with this work for additional information        *
 regarding copyright ownership.  The ASF licenses this file   *
 to you under the Apache License, Version 2.0 (the            *
 "License"); you may not use this file except in compliance   *
 with the License.  You may obtain a copy of the License at   *
                                                              *
   http://www.apache.org/licenses/LICENSE-2.0                 *
                                                              *
 Unless required by applicable law or agreed to in writing,   *
 software distributed under the License is distributed on an  *
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY       *
 KIND, either express or implied.  See the License for the    *
 specific language governing permissions and limitations      *
 under the License.                                           *
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>
  <xsl:template match="/">
{
  "unknown": <xsl:value-of select="count(descendant::header-type[attribute::name='?????'])"/>,
  "unapproved": <xsl:value-of select="count(descendant::resource[license-approval/@name='false'])"/>,
  "done": true,
  "files": [
    <xsl:for-each select="descendant::resource[license-approval/@name='false']">
      <xsl:text>  "</xsl:text>
      <xsl:value-of select="@name"/>
      <xsl:text>"</xsl:text>
      <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
    </xsl:for-each>
  ]
}
  </xsl:template>
</xsl:stylesheet>