Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011013.outbound.protection.outlook.com [40.93.194.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859091DF73A
	for <chrome-platform@lists.linux.dev>; Thu, 21 May 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372417; cv=fail; b=XTgApkpA13/5WKROFQy2DB0dbtkKO71WDEQypFU3quVBF5rQxSFkTxf2qACiVyO08KknNeh7vWGCE875TYNYOV30PTkIIg3dRU4vtFT9gk+ocvdh7QB8mZW71U9lf5M0b7PshTw+MCo+MZcw0VpqCAjJPk0YG5mBpn9f+SLcA60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372417; c=relaxed/simple;
	bh=Pu+fwXJFW3dirLQNBiYl6bAPF8l3FJaIZiljUJHxLEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ULNscdWdO3z9s4LU5WkqdBYNlithsIw7o1sdCFqJygY5AVZbF1EC1iavCPfamoeVCzI/OWR6s8/TiZuViFgD64pD8uAUKKq3IW1agIMOYvANHzo1qsrTwtJYi05BouTt4+3oYPwE7IDP6xjsBJ4bxDRrHHKGy4Brg1/H91Q1gSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BsX7JstF; arc=fail smtp.client-ip=40.93.194.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BsX7JstF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+8oKxHXyFtYZvmAKMw4o74ulb3WBuDo04yfGnEpFG6L1CsY72v20KkW0t5R7O1YAdRUAguNQF+LByseH6OgysoKdUfdkGrMxFLm2Cez7OnU/UrcC2Dlor+PIWL8D7gsUQtjdLzf+zQtXQa4kIUEe17c4V3mWVkMKxUUpFt6FRAOqhCExqedVzI8zcLSKz0sNxDYi0eUKm5AkFlAXfR3cZ7j9XnhXE9+5tTEiqIZM5OVvqR0G4+G0HbIPR+IfHgn6cOBpn/SHfyveIUWE1MNlrab5dyCeNsdaYtK35aKaKyjtPT1cnZKsALfvxk47JPt2SI/dqPCLv++dZgYroM2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocl3CI22lwn1s+3E8rMZKusIX3+JuIwZhqTMExhPTXM=;
 b=Y486Ae0GKVpD/gg648TGbWf3WLVQsIjES4h8GqE2dTHccibbgUsRRTkJRakD3EJavLQBbqMlgnYtr4R10pkiEX4O5OTBXFUjwkmWRSXgQS46NtCcGs680noBJKOOnoCOMRgmkzFD6YhDbzwWKtJfz+N2D9PdoQnGNbXGcoXVYgE6mDi6HaElv4qQHmbE9KNbmr3wVgKpyAv+iM7s/fvDpPJyJUvMke1eUMSZqThd6wWB3brfYrxs54GTenmdBQG2VXx3ftZzo2V504qs0+8M2Wu6fKpvaoCC/igspBqNY9sDqsORFluQvzmQ1l4xRfftKIiYwrxAuzN5rZ4shgMwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocl3CI22lwn1s+3E8rMZKusIX3+JuIwZhqTMExhPTXM=;
 b=BsX7JstF02dYbnHJi4BvtvhXA0f58/BPlWyKYqPD71dhmb+BtUc0L+EyaTkEbzwbumzivpd1H8t8ATJRqn8T1Ne0kYcBZMRaEMkdtwg98+hF+3UzDSsRXQcnd5Y8tR55sSZlIZPwaifO40TOHF7V6J65SP5+GX07ioVl0AnWYG1YnyIEiFJOZxsv6q/Kw8AjTLSqRyEA+8A/WZgXjj1lKYJ2UmoXr/Nhs3qjlQgzYcZD/7F/ySp/5eZUZEEOCkPw9XK5nFIjh8EuFwDOm8Djy2o9E8mLbiEwfyQ401luEvfjjLD4MGKpNnbQCbx1jbMheZRCMZ6fzCM5EuYpVrIkOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 14:06:47 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:06:47 +0000
Date: Thu, 21 May 2026 11:06:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] platform/chrome: cros_ec_chardev: Fix a potential
 UAF
Message-ID: <20260521140646.GI3602937@nvidia.com>
References: <20260516143017.18560-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516143017.18560-1-tzungbi@kernel.org>
X-ClientProxiedBy: BN9PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:408:fc::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 426359d6-830c-40cb-12c5-08deb742322f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	UVoE1AckaIvGd9YxXG9iKZ6ebO0Nm7dJ8E/9oCxSG04abVr1cNkaZC+xGIZhbIw6QkffdjF9tvXZ1N/DmenWQU3Q+3obC4HzpYhW05FMI6lTZt30/Eyg0ar+aOmVrgGxMYh6SrbuG1QGi/qrh5ZYvmLPulfwbS8ZrhZ5VLi5Zn56eJjv0xAzfJT9nWmBQMVjIPWKOCmzJQ3r8RFsOGtS9f8P0rYfH9ntJAayleynHuZFJXvtKb/6TKeoHJnhS6Nd9sifD6UyLUQ+74aUSkIS6Faib6YuDzx3Hwz+arj8YMel+nSJJVcIXzHvNMY3S/17vMpK5QcOABQNVRgM+9RFWwBfT0VdmYasP8/XXD6G8k1lUvl0VOZ5k0RXf9AzMwqbaI0bC4XxU2YR6orKTwK+B1nwrjVhaZi/fPV1eWSvo6J9OR18xhSTJntm+XpcpW8YQ7UWH4TzAS0OSMnpM4WS+mUWKaCPkQ0iOpMVxVXkNC8tCEnWAMcAMlqlVBqx7iumXKIMcTNlQjZCkSYtR3gs+L+AnXX/bbNUCt/K1ceLfgA9MCa3lDVazxCuosHxlLjrlCvpx/dfdWEUjYUaskHm2IHz6eiBRIM/e3+Ng3kNa2ZYjbGauxC4w7O0P/T1XbZAs1J88nvmYU9uWMRbSCokReYN0BKFLBpDnQ6xpgBKQHMOyAXWXQ2XZbazm026HUrK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JqR53WNFOOxyhRvLlm0Ss5l10qE5lb0BkEqcWCpFlKi7c8fbZXGOi9wx9LZ2?=
 =?us-ascii?Q?ugcYe3eo4yBGrZrdf0s2TdSXkHAPOtEzvmy5TbctM1L2nDmHG+TG/VmxU/ev?=
 =?us-ascii?Q?+i780xhuBFBXMdxwyiGcnBc8z8bSwdQREL6VTXpXqeZ8PJPrKkI7oLfrFZVX?=
 =?us-ascii?Q?9j/10WQDmenJIj7LYBgOkVJcbumYeey4qEpPeYRuCmXFEVwNL7iVQwRAcz/s?=
 =?us-ascii?Q?JVJiEQRGj1EiKAITNRX6mLhYIGuXr7fsDHg56ryMsjy7nQz2fxpNHi9Wz8B7?=
 =?us-ascii?Q?F6WT/7CdyqQL64oMj90a/9yKIWEGpHyM9QxikMDzjTanJ+T5nAJq5ZtIqH1S?=
 =?us-ascii?Q?zQrFgr1+KXmqA4TJpUxfR6sUrymbZPSeoHHB0hr1PNTTj51XcdkZfSIDxkG6?=
 =?us-ascii?Q?+5YviZQkKRQD0OnFftWYs2VDPliSoJm/+Mh4FIXhg1QtdJruomwoidnmRreB?=
 =?us-ascii?Q?akML+NcZQHqe1rNli/QDegnGir+5iskbrhzS1AdnJVAsY4L7WR2u7D11d5sk?=
 =?us-ascii?Q?A2pJ3l0Kn+zwIhtAY75MPIvBAp3HVmA4p7Fq05GvAmnu8VI1XCP6oejvuZ+R?=
 =?us-ascii?Q?KRb6uHDMA7DWVOxsoSaTa+JiBAtRw7Mh4L86kUEnZiXbQjX4r0CQrpsHBH7s?=
 =?us-ascii?Q?20wMaba6WPpWIa//eyWmCIIP7NWr/83gq2oLn8e6LSrl558dLMBX9ETFjUog?=
 =?us-ascii?Q?Ez3cdbiUBL5m34Nxaqs9XaLm0TFe1yXKm3N5U5ZWS6oLuutysKaLdrrM5RwZ?=
 =?us-ascii?Q?rW6aANHNWDAhhG0xSRk7I0yVDhxjCf4UsWQFXre+S2q/ILw+w2QjhjLpE+aN?=
 =?us-ascii?Q?iGgSrFCUXmzHXt/H59sUzOzE3yyrBYEVGEJvybSdmnTTYT4ZlUnlRATMNAKj?=
 =?us-ascii?Q?zxwLqB2FDVK+U8pw8wHK6eVWSFQpwaX6TuRBAZN+cYMy/SmKZEBQdk9HuNqo?=
 =?us-ascii?Q?30zm7wA4HH4pd/FiAkAQbpe7DDKL4g0g+xxONvK+4sGrTj0tkMI9f5d3lDQT?=
 =?us-ascii?Q?wsKb/L/0X5AJJQe1LTjO9R29fGaD3Eoqr7NLbv5BioOQnIC8+NDne3PpJ2xT?=
 =?us-ascii?Q?nhIBAZ4S0seUlvJz9Na2xd5V/RgLV9LWZVgZHPn+pybtHmiiD3b4iRHw9+pY?=
 =?us-ascii?Q?tsodJQVXAiBHREqscw7M62l3kkYs43DaJkDu0vqR16IcBK10zh4sgBOL2636?=
 =?us-ascii?Q?qyLyfyym7R6pHw6OH24Ct4Ong+mECf40PO/cMC4nv43UWfuJYxuQ7RQzC8hX?=
 =?us-ascii?Q?veMmZ6wLlEBlEO/i7P8wEFkiO6xoEa9gH7mOvbj8BN1j3rn4ZAbs62A16l7L?=
 =?us-ascii?Q?SIiwsffzEd2f9cgBTQRko7SbUV5PSxTz+gKJREWTtgReA6X6EGe1l1/RBPs8?=
 =?us-ascii?Q?YdNX+VTIJ8iFNpn7jC6tpxSTOrD12TGy9Tv16LECzpjFKr5+VCYQ6/UYb/+V?=
 =?us-ascii?Q?2PRzGxqyFcM8SZ2n3SSctH6d/uRtPs4t9rrLui8aWzqNNO7ZodH7ZuSa7TTt?=
 =?us-ascii?Q?AOOl4+pePNyi0TPWSlJaOIfrf8+JD0AsdHuxZSRsH3YoeVRXuGeAY6wrlBhC?=
 =?us-ascii?Q?GQ3mA9mmn1hM3sYe5MIdAoLnMRHPo7/fGfOpgnJCniaSWNVKcSsfGEgmb0q2?=
 =?us-ascii?Q?lbSKXX/3Z6+x0u4TZchXIXE3FQHlvw3snkZJ6QPuQIw5gJTBao/F/Sg4JEhv?=
 =?us-ascii?Q?hZ317Zrdc3UhjOuSQ7jkHeR8Khkzi/rFJ04DejJrL39FP/IT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426359d6-830c-40cb-12c5-08deb742322f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:06:47.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9oLXlZpF1VW0NnABA+M+OPfzt76B+jrVZIU+72pJ23Q1oAdOMgcRaFPv6S3W6W2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447

On Sat, May 16, 2026 at 10:30:13PM +0800, Tzung-Bi Shih wrote:
> This series addresses a potential Use-After-Free error when a device is
> deregistered while file operations are still in progress or files remain
> open in cros_ec_chardev.
> 
> - Patches 1 to 3 are preparation steps in cros_ec_chardev driver.  They
>   introduce reference counting for platform driver data and an event
>   relayer.  This removes the direct access to `ec_dev->event_notifier`
>   in `cros_ec_chardev_release()`.
> - Patch 4 introduces a rwsem for protecting `ec_dev` to prevent the UAF
>   error.

Other than my fairly minor remarks on the last patch this whole thing
looks good to me

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
