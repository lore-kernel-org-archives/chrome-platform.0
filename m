Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EE72D77E5
	for <chrome-platform@lists.linux.dev>; Sat,  9 May 2026 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778344334; cv=fail; b=KaR0hG9mt4iwqb4akF+Dzkn1UZKQLABKm39ZTvLy4mKwwHMlY4yzc9ZCdfu96lEvS6wpJSF9B8ntwVM+jFq5CkKHE/Hd9mWX6OS+ywOZOoFugnuFufkdtYH3FEBAYJnOaQy0nxucsyKvrEoE330DTULvoyyBkimeZ3jdMBFrXJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778344334; c=relaxed/simple;
	bh=rFaF7PrCaSanSvoOgQlAeVPHeSRTQ7xvvv+JeoLXTEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZVWxhY/xJszJ8K3AUYyaQZpuOvpFw9T30p18Ch/ex92Lkxx3hkNcIyXKPB3AEZRjaCWcJ834QNo3eOEXyQW8JXGP1jicAUz8+2izlPXj6uM6dOEYAIz+4smJ+CSBzP0jlkQ8NoJn5rfWpcUoGgk2hyvbtppp5J7+H8tt+ye8+zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LvVIeUeQ; arc=fail smtp.client-ip=52.101.193.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LvVIeUeQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOM7ZVyc2jJxl908/ObX+ZjP+cn9cORaxHS2IB4VSF0R9yCgQ+3fwMcg+bEbdzQpLvsrmcPR9UvU7hKRMyo3WzcX3rX3hRVYoaxDttZbKH3We4c8EEPPhrzGdmBIHpZw/yRUvEp2gBMJMzOyZSK/cMDjfVusTM6OLyKdZd+AY4JDluhyzQ+AlZG7vOebMRNl3wl/xu4EKph1S/j6q81naJnRWnsOBD+hifnJ5SGn2T9v6iqjbQ1JKJCi+8cZ07zCR1ZZU3BdC12cO75iqoE3TocyIh2EihnCgdl9T+v8PGuFYSRUu2Pas2y6+AtB62rb4ZYCw05aZysqCzrECJjgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqrHc+LPFxLZOhI3o9mJQnOJ9b5mCWqO0FK42w3iOqQ=;
 b=pIXETcvY4zbmbvinW2tfeRS7sHuksNnyuqNThctSa5ybLixM2TVBnwA4CILXUSmbrft5wUVEgzoAcssES4ocwHOoyLv13kCDSrExZamJjW5brILdbA6b0RzOMQpjdv+gdo9/KHLHlQTZd3kvge+Xj+Xc1MYhScvOUjPjsdE5wW0CnVClEHhkWfaKsYFaUHbNM8h5JjSmeXybww3R/Db6SI4f4lyh9lnnY5QrCxRD2WmJVZd8Gbtt7P9MBNkGf3nls7z1JQCHv5C4lYe11jbBpQz6Mes/lqbkJypyRxlzzlYziMzlkpEmj3K76Mjbm8HmpLr0LCsdSw3FOaO+oB0/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqrHc+LPFxLZOhI3o9mJQnOJ9b5mCWqO0FK42w3iOqQ=;
 b=LvVIeUeQ0ruubtfWuNAxYzWFyRpay3zl4Olit+j/7famMEZGXFMtsT2QTR7VLesnQ7cQKzG5xZm+MxO/jkH7lEIR/k7kUi8u2RIzp5dJyLFse3/N9/p7IQKgXxppBJ8nirIPDbDj4BPgT/Om9cM6OL+rqCsjqcqmG9pX1Qt5sj1wRni+M4tdtvLbJWxPKKrXmo1YCm7LEh8uNh7N8KMiAJc9fHOHk4tBBSqKb62gEicCBZ90idz7NFO1iGDs5CvlEppyc21XaukRJc1V8HIt4c8abuy3mBWqrUh/hz6niyTSUROzU9lF3LfBiNG7fmuXnhg2QSZwuLq0ObWovST99g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Sat, 9 May
 2026 16:32:08 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 16:32:08 +0000
Date: Sat, 9 May 2026 13:32:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 3/8] char: misc: Introduce misc_sync_register()
Message-ID: <20260509163207.GK9254@nvidia.com>
References: <20260427134659.95181-1-tzungbi@kernel.org>
 <20260427134659.95181-4-tzungbi@kernel.org>
 <20260428160956.GC718365@nvidia.com>
 <af2vHu9AiSeGyp01@google.com>
 <20260508115444.GA9887@nvidia.com>
 <af8BJCaJYVBr_P3u@tzungbi-laptop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8BJCaJYVBr_P3u@tzungbi-laptop>
X-ClientProxiedBy: MN2PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:208:23b::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb14de8-2bf0-4378-f10b-08deade8837a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hW+eSzTpUk7aiIB4VeOpBc0q8BI7e4dDfe6C0f1l/FHYcb+npbbT++w+JUgzIhJGK1c5Un1YgtwjXeQUS60m/yuBRYtcuY5kIIhyrIVvE9U291eM/FBjpPGJeQSgU369EsCZe7vLHKRS6OdLcSZNvkzqHVZ3V0u8VzKla7Upgr+7gFMB7zPh6oQk4cLsNMPwOhtK/wxoNp9DG0e7LU7yuK6trsV6pT+2EUslgFpAL1sIvHwNCV4Ou1QzqLTi7huFz/bsq9aZCHXExVwF1d9iQe8xx8DN+DbM2tFAVSSlGHLGpoAVOfxhXrFfiTFtEBkjTIf40SBx9rUV+7mEa+aR0Y+D+j9rbWrIr87aqYEkuNLerPFFibnt0cPcu4NW53XduwaVZDicqFx1zhwWhs3WFoGGDOc0oChZUhxPzi3VRJWLlhahnxVppJ221hr8r4hOfWWUbS78iZpnt8eEaGmDxWnBIQgpceKlCj/QEZ/r8kc4sa/JjzrWnjDEvSdInhnoU/twaO0UPEKDAzf9h4EFFIW/IVDWZQwqlUIU5rz6Uf0uy3cWXgzk1eavKOMJgIio2z5EbDCT7jgLnDMARtcRuK2WXcFe85bqBDmKiAqRjMQYaBTdQE6Yo2y3KPDkC54gsPLHuhcPT0AN4+csn+uupjh64g5yE8Ld+831P30TmdIa9Ddmxz0h6oN6qubKbMuW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uh0A85mm94F3h9uiq4yxPaLpdKLG9EO00kf/LzowaOW0BBuyHC9gAO3kzATj?=
 =?us-ascii?Q?yjIPdgeIsLYftjXi3f5vdPGlaWKkNRpfhjwKelGIQMADSu1dPVnl1s2AMi9T?=
 =?us-ascii?Q?ijbJch9U2Rec5Ixxy8OKOtQCTwiKDy/usouqgDomR/iiSaUG58OiIOFV+5kt?=
 =?us-ascii?Q?nRV4PrFzYsOw98O3qnxCAbgTHIetccItP+/F7XSkYLLTWTxOiFByJ/bjRZHy?=
 =?us-ascii?Q?ewMichogU1J7VlO2YAkRdVLrow3m1ciax4MiRV1HXyVNwQtebcrGggZZJm+V?=
 =?us-ascii?Q?L/GNmWlPfLB1dVVO8sJSnICJnOZ3foSWGi/8L0IhlU+luL+pHsiaNAku7Ow2?=
 =?us-ascii?Q?phrH8lxazIHJWcRPorwfWq/v3Nf4VRzwEw2ZikhDQNZuqZJJzqyO2jSnSxBR?=
 =?us-ascii?Q?Gqj/PVG5Sc/sIDOvs1gijrf1g8B4IQEUa+3kjtWKm//N9wzShMY5KmkFhvwZ?=
 =?us-ascii?Q?CVD+o48+txVi8sIUbJXbv02cKDOTzUQoH/7Pa9HPWP6r114lfi66Zf8kYtXu?=
 =?us-ascii?Q?I+UrFuAmeLejunTmxAbfWgWVCVwXg+Lg+Kmvtpd9FiYqKvO0z8wiCBlmCHKD?=
 =?us-ascii?Q?+hNWZM7lwUSb2gDuenZz27m9gyX7EYfL+jZptXHS/whQylOI6blj82MJAmXv?=
 =?us-ascii?Q?/dA+cC7kNhxdHeXNdNdZqOKfbDKJkiGbQGN3FMFqFFkTs+fFZHPohCkOjvoJ?=
 =?us-ascii?Q?kMvuSIPgAoAFFc6IpecbpiaBJ6dt/4WIh4Bo+p8MQsbuNL4OiPY0GJfrDE3Y?=
 =?us-ascii?Q?X5odnNtvBekLm41+eHO4dbp/AqpWcWAgZd8lgVFROCNGNWKb+2EJFt+aNIwa?=
 =?us-ascii?Q?elc8zcTiNOU+EqW1/BJzjvMvHUw6S9OuY79NwSo7cDe7w3Sj5qfoFXEWcVBj?=
 =?us-ascii?Q?R2iwbGuGE17H5OBObU8I37GwriComMI7eBHArTgQO81IRAJTKZ0g3TTIBA/I?=
 =?us-ascii?Q?2OAll2jnjyPQVVuYLdafj1JRuvakmlLJuh+87y1+RTKTGLpCk47p/QyvJwK9?=
 =?us-ascii?Q?sIYJvvX7igO4Kye+ZgbmaMuamv2xcqmq1actA5U+3G4dQOTYECF0akUbaNOx?=
 =?us-ascii?Q?ACkgqJGyg0loAgWzpwBYFfLUu1Kf22ge9uGhmdv2SvrzolyjXIBXMCrfEqVa?=
 =?us-ascii?Q?MSpurwS6SrpyKY9xaUIlfwK88p/3pIr1cVXcvedpwCdhQ3OuNWn2j//G43Hd?=
 =?us-ascii?Q?t1BlmuH3oYUuWV2ANXoMO5eyhD0iA0wRGAyeKAB2P+bQDKhqrbAyz8YGqqxN?=
 =?us-ascii?Q?bbGpJJdrsqhApjFSQJd5ndPJU/U6WZSEkQq6oGYqDfl9MhYvbPPAmArKbrGQ?=
 =?us-ascii?Q?3AQDlirt6yKY2juHfL694GWLw8XxU8qT1688EY4mxZahi2winM1H//0fEXS0?=
 =?us-ascii?Q?aiqFR33wG8CaMK5w8YEg9F+LvRarCNBHgWKvc31sDKfRnM3UBW5WXl2Mvc0e?=
 =?us-ascii?Q?CdfVvLwLYW8bnIK8A9Amf0lC05qiH1osp65K+A87h/zFQGfExZmT5EpoXNiM?=
 =?us-ascii?Q?ARrHHD0KT8FgUE49Z0Ore6r/nsXKk5xmHTq4e33I+GO+i7efkGuu/lKTuOoC?=
 =?us-ascii?Q?R+ACNRBOk4C1x+DDXvJ6oysPk41bcYTOmGG3IvRC+YENvjnV+qQiR8XFHPjr?=
 =?us-ascii?Q?LBGmj6vZX1aelt8xZo4rfPZpO/GtUiThTJ77FfSnt9KCHM36iL5s7/gApcCN?=
 =?us-ascii?Q?8RaOCmJa2Kum4qG5YewwvfrrPSKaXTCqiUr6WFzF4MiLXawH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb14de8-2bf0-4378-f10b-08deade8837a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 16:32:08.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gs2QSU5qfKdOEKVtvGKvFMoOX8ZhPNAVikaNALppw0SAqpMt+xX9GTCpxgS3hSb4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795

On Sat, May 09, 2026 at 05:40:52PM +0800, Tzung-Bi Shih wrote:

> > The drivers ops lookup needs to be O(1) on the system call path.
> 
> Achieving O(1) lookup is currently infeasible for the misc subsystem.
> This is because misc devices use the minor number[5] as a search key to
> determine which miscdevice the file operation is tied to, which
> inherently involves a linear search.

So? It needs a solution, you can't just give up.

Probably it will need driver changes, maybe focus on cdev_device_add()
drivers first.

Jason
