Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010039.outbound.protection.outlook.com [52.101.193.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB494A07
	for <chrome-platform@lists.linux.dev>; Fri,  8 May 2026 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241362; cv=fail; b=Gy7hpD1AlCzdLcOMGF8i6HkXqK4kpBO73+ybiX5FNq2cBiH0Y/8IA6YWQyEAPL+vLmNfL1S4hVfop6xjAHNZzxS6z8iZQodhofSawszBYvZhFT4ICu+ZZ8CaMwxrAAY5TXPUL2f2Hh/1Av6TGWu5dV/qBqa99cH8sEzCZoVSGws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241362; c=relaxed/simple;
	bh=6mJr8JX52TKU++hcfJCEk59Hwmp+6Cwpt5F/6tHSbPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tn6ZbFqjlz6RZ9FHU5DBrs+C9VjC/xA96ZRk3+sDb7HmVgTsoMBcNV0wzT8EPYAqW+hMzEfRDjHQdP9OAmO82P21NfkoTmPcx/npGr5UWHSSyE6dhHq+T640B1A3zhtXzcOQ51nvLdm0vt6niHi2l8aDQ2UbgNXZ8XIZ63Uq1A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fbZW52eF; arc=fail smtp.client-ip=52.101.193.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fbZW52eF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRfkN8bMvoTnv8yWwfeUOm5pYnl5Cg2wQYF7zSFzrrRXbKux39eUoLy1vr/Yw0S1adWP25MrZ/nYfoSQ0Qqj/uSUyjFwerM/4ScnIq9np9BO+szbD1QaJPaGinglGK6JjeNfK8LnVZfxKaxK5N/NqfvcQ+1v5HqILFnubkreUcYkifvSiVWuVJNhEB/gEC3ZzXNPaJ7kkRwdEXhIb34ELZNUmmImg0cZzcJ+qEyGnac5x5ALQ/I/i3Z4nj0az+b7kCf3BQ6HxgdbDB/2c4QcpYMwh82hA/wElZqpKY91TE2cwBDMG+eE7PIo24k749q+S+bD4OewQgqLhHY9FAxg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvbijnFoScXNXmVTfN5S+DstEdkMvGH+X3HvhrokLDE=;
 b=yEcIQ54UFD4GFX2qSmbVzmCDJt1F2O9DgunJu08X8DbvDY+U+R82MQPCJjbs7gq1c11zD+OdoxLVtXKYhNg/lRIb2yEzntWqk4zND9cljddne2faJkMm6jnAG36e6C8XzJKwSJxm80Nepo57VOuqU2qGKDt1tOxBNUtBDHywG+BCqzfBKwA1sLFvNdpF+7P61cGmV03HlbvpjOkN5OnSmnBO0E7M3LcVfUxqW0iIvoAf9YJcDpB4ymtJVNCC+G050ADwzWs409WOzDtaiFJHBsdN4wkU3O/74FgpYsQmFpYziQun9mrjUMwyk/S0XoFWq964kx2PQ8POLoNL5/LG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvbijnFoScXNXmVTfN5S+DstEdkMvGH+X3HvhrokLDE=;
 b=fbZW52eFOfDIsj+sTG9va5KJV5mxRxNsyp/NCfc9a0asVdkovGbGzvbW/1hHdxkcsmMo26kkxpJY13RD+9Eu/DSOMtemOTILMSb271Pr8/EKdxgfjeZ7sW89LDjUyp80e8ykqyK7LlA/+Mip1W/d/yLc0K62heALBJIl6PHaRN+tj3hZpPuZAFZDyuL0f/H+HVR++JdPBeABupmgbYwFoOLK5yk3NXdq/Wsd+H0/AYHKoN98WjyENDrKqp/MLLj5k0eFcrek7HqmDXiH+PBpbJYryC3VIGS0Rb6V+d4nkSk19zwEpJi6a+jGS0S30nOID+uoz+rQMRh6ZAozbr8/zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 11:54:46 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9891.017; Fri, 8 May 2026
 11:54:46 +0000
Date: Fri, 8 May 2026 08:54:44 -0300
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
Message-ID: <20260508115444.GA9887@nvidia.com>
References: <20260427134659.95181-1-tzungbi@kernel.org>
 <20260427134659.95181-4-tzungbi@kernel.org>
 <20260428160956.GC718365@nvidia.com>
 <af2vHu9AiSeGyp01@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af2vHu9AiSeGyp01@google.com>
X-ClientProxiedBy: SA1PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA0PR12MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbde9b8-513c-4496-9dfa-08deacf89940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	594x6a2whyy/FdJSAF5XJlcRYct1mbU/MbyGF5Z4dRCHVv9XRsBdbaUPJs4YR+uL+DrZh4CLDuIOH4wbMIQMKY8r74S0iDOTUcl4OYi3FJiYQ0mm7tmzCCr1WomDcUd8gyW7D2AIFwsTpb6r5zTj/QOGZrgkV+voLcFpwb5+gJk9XChPxNlndVI8846MtOdsNmRsaZSQecbiZyYhp9DKZb1LWu5eGQEjhpFUqQvg+PYtwAYvN7PCYl1Jl9NBej+OPddGaCNz31YCcs0zeKGO1k15KbDPxapjddQHaaRbUhlP6MorHMcLKLMkFGmL2ZQF0nsRiIW98/4hl93ICGSicSwB2rk99RbJV8svI9P00fiKhpy2pJeHL6U6Q8gsrH1gn1Byy6Z7eOAKX0KaNXt/gL5x/flarMz/GJmS0rcH0ctvQH4fB2vLW4uE66jDKqOXSLOPuTDue/NBS9aOsSYIyh3EpDQfN8GwSUC0EOHhFJwso6uqVcFXqicmC8OSPF4HXFsp8Sf+b981u0KFUUhABrso3Nxcks+dT09MMhQytvvE719lF3OPfkTszRkayQxTVkMr7TYM7RP0l4ugSJF2HZ7KEWeqmdxgzXQ7ZTrpOAPCI7kfYAlXXXiiFSUfHi1Hm8az1futLymjl+hSCchWGuakpAckcGlHXTReTUnXVHgUdbpC1ZciRtdonNyYGDkn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cLhj2MDOhU4WcBlkjLPfdQHvoKMWeoKNpON7zljangroVkITOFEYJLE+vgCX?=
 =?us-ascii?Q?fES7I8O6iz1qrFcH1tb5A+0gthAuYY3x89plq5OAnyjPYMm/FfQanRvok6UZ?=
 =?us-ascii?Q?id/zbAwuo1COQ4wKp2kelwBdJTjSfP/jR4zJZ+CxCeils2f9cHrNF/kUrRlB?=
 =?us-ascii?Q?2zDGnTXexaGViTDjNSzcLq9TMpCzFf2y5ZM3Y5G4sTIL9AqdLiIKExKcavCq?=
 =?us-ascii?Q?X9QrbBuXOtZmaiJ19/Xe4N0d0B6+znXnvuQMO7n0pYgkPAORgWoY60gNR1Pm?=
 =?us-ascii?Q?vOxBboO0ZHoTIjbxo3rZhR5Ol1t4IKt2QyBSKyUyp0xoNVs7j78rzyANtAVa?=
 =?us-ascii?Q?ajqVaOHkbaBRvMmDAJmFyTl6t9EMp5XyzArew6tIU/k7LwkVDYzZC3G8Qcqh?=
 =?us-ascii?Q?YEMrXzNtwMI+GYPzkYwKYVHdO3Nu3yTtK04TrKlLCbPtMQBbI+A5gzUxysuJ?=
 =?us-ascii?Q?Fbs3RVHAyP4bhPgr2udeyDSJbZuDT6JRLvbItHqQMKgtlY7rat79t8R7IRrw?=
 =?us-ascii?Q?W5jRn0Y1HCI/18jsool2w8XijsHMSJylpCAgmj2XgqRVFTlNLsY471ABCJEs?=
 =?us-ascii?Q?scxH6TG3ZGbUObvnTVoVG+XqVunrk9RTOz61VTpi1KFN7v/5GStcp95wNITt?=
 =?us-ascii?Q?fe7IndqD+pGSeZHEvyES0ashlD0LxRRSQuh/AkCiLNB7yuPxp/mqN1R4UtSG?=
 =?us-ascii?Q?dSb49SqCi5dO2N4cbsMBQ6WW2y2Mj5Zz1HrHI9fcLONqEC7frM4DkcxqfOnT?=
 =?us-ascii?Q?xhYt+jz+l7lzRzE6ktmPVkqLE2Jh4SO2NQ1NcCErpNidOcxFeI0UNNF3MBTn?=
 =?us-ascii?Q?/HwUyiP4tdlkL+Dj/BE3Peq6fSP0QSUYuAU1jTbespc45X2+V7XGw4DvbxL9?=
 =?us-ascii?Q?gW0zabkQWJxXwQoM/SVLGArUL3jyTAlis1OJPaiH4nHhH8/AxQ5xsU+Hl0q+?=
 =?us-ascii?Q?XY6TcBs9JPWP11SgyDRJqkU4nwuBx2ZQe/oQdXhZ9LIigEbVVjIvr6MgFV4x?=
 =?us-ascii?Q?MDtct8/WPnup2jpD31RURO1reu9qa6mnt7ZMsXMJQHA5qjyVYIbIBLICrDBR?=
 =?us-ascii?Q?0f2zGSnRSxVhn1vwpa7kyZJfV5eM0Kmq1fCjTTx7e0k+S558rDqkb6HXjPnD?=
 =?us-ascii?Q?CfGbhCrmrLhOIdl7zhcN01kYU3ZfDb3/Lki56nKIHmYws2T5k+I/WxzGeJHW?=
 =?us-ascii?Q?mXVbKMv7t3dXiOtq9vMnUmkX00kbEbDxWT/mfiqR2xzJer+rqIBtR7g703Rp?=
 =?us-ascii?Q?Uhi6UYE68Fu9kVHAseHX6BZ714s91uGH4I0vcVhJvo9fgFBBm5Iwmgpl2WWY?=
 =?us-ascii?Q?qcWFyBplmghd8x0ZecxXDHeu5m07vTZJPvYya8LG/ShIdagTDS6c/ejKkair?=
 =?us-ascii?Q?XxfSOlyp/A/gzgd33HAdiBB4XRl5OsgPdMtDdw8H/1Ifo6hxZbWRvh3qNwwq?=
 =?us-ascii?Q?15AjjlkuOac+5eu0TNPU1eInKCP2PJlMD2sjkUegfKLSsmTLToqWJ4AiVnO6?=
 =?us-ascii?Q?KCy0ud5sjgFwSqzABi42EMq/5GlDF+tyVORLPki33Qgsxc7jN8j6NNrMmkB0?=
 =?us-ascii?Q?BMLCR7VBkfaAY2i3JkX2ztxNJ5a68KIosW1/X5hfswoWs+mMeu4LFgZV/DHw?=
 =?us-ascii?Q?h0auaYpdkGm2svVa1Irvo+YcpkrJkWFW7sn7kqnM7sYnnQh6/b1KIGoNB8/D?=
 =?us-ascii?Q?7yFcSEXDh4uoeavdqKBWfk8WAkJpNPPgK/reptOgQpkmbne5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbde9b8-513c-4496-9dfa-08deacf89940
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:54:45.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMfo6U1/GsDvVb+TIYAUrEAYGmLsi7uzkWX/+tE4qRWylLkGodwjXfNSndh1AC9D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076

On Fri, May 08, 2026 at 09:38:38AM +0000, Tzung-Bi Shih wrote:

> I see this as the cost for synchronizing file operations with misc driver
> registration, as previously mentioned in [2], which I believe is necessary
> to prevent the race conditions.  I'm open to discussing potential
> optimizations or alternative approaches if you have suggestions.

I think the past threads had many different ideas, I don't know why
you choose to present this with something that is clearly acceptable..

The drivers ops lookup needs to be O(1) on the system call path.

Everything else about this series is reasonable, but you need to pick
a better way to do this.

Jason
