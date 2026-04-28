Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26042450909
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392606; cv=fail; b=mfIsupyEJBvaNOCkAa9R7rTwz49IRj7ecQfSQMAMKBoPYTyPqlBUtljSkE9Ky1UqTBNVmaHA5SCQ/4GTKDr3q95+0NG9UlQQcD3QmTyxGxmdHZ+AytUh9ERIGzK+kJSQ3BnoRAUcTYf3sq7t+1+neZibpOfLhXTS82PdbyrGFwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392606; c=relaxed/simple;
	bh=DG6N4SnLCp3FgxYC5aEkhaEQQPLlcUmT6wQF2rAOdOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n3CdEH3xtqR/4B+DgCPDnpYo9GRuYdPOm/maqXPqsnQBZdteVD+zu12hTfGB2PCJ0GSgS+rH9GvckYRwUybk9ui+q6b7JnCXDOZ7THjHKPxNUGghXXi6asLwEOkOv78TcLOOnWivXsY/muk397wfQJJr77pQL9LGVv1FgtxDgvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iADWrryR; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iADWrryR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXoOk6OuDlWyjMaT3aOr+pcHNpoD2xhF1NKI/IiJ/uWok0pNEexccLsu+rHSKPh2zOYuGxkfQbJgm4oUeDC7xJBLH3GO0KKeqdzG1xAOBRi0tewbViULoc2rq1igZWlb10rlKgUUldKFmz7CDMPnKqUlL7l7aS+Mf5mkkkcqaJohGm2JLBuLfJcBV6Wwh4OkfZIFgNONkdueNaIgfrXvGpw+l4cJuQdmg06Bsa/VyxCZJJXheyVWqMgawAgpqAxd+bntCuJFrxvZgrJSunL5RDrDalboy4VEhjEQigPv/O52+Vx4FTa5hMZ5T5gd8Nal+4oEVPv5GkqqjXYjAbQtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/Xz6ttzSi6yyksdVX3/+p5Fv23x7xHdhdmeU7RSEuA=;
 b=j1FLrjvAclWZ0z+NFS17k4i91eAsIw8QLuHqwOm4bMPJSZdXEydgiz1bp/mPLtZoRqYf+RS2vJeQSrsiKupMKgAgzDNiaMANwkV4ryOy/vI53vdYAKSfXYeZaDFgNjZBmLMy1D0/LFNFatVbpTx+V6PNviTXJ2lZLzXTdhQ9YKAgRpHNlBfRYiBqUJucJXXlSYbU/t9j18luYdPitSxg3lA6gWYBiEUTtcId1mNF7OKLfmB/B8wHnZWztENyh61QwCJ5QqeBf6DoPeWyqANggdTIkd9JPuSt43Ffsp89esDhgiZfCSJ5JmL8WXSv78ddpz0yWhss33TuR/wfufpgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/Xz6ttzSi6yyksdVX3/+p5Fv23x7xHdhdmeU7RSEuA=;
 b=iADWrryREZe/52j8wYMfWnNojbqXR2IZihl2674F1MK9sNh5y4sG9Vy/X/Ory2slsYfA5ZxGVywaZ4bASvb5i+X2/a71Yvp9KZWgzrOkVsNKWc/moS/Iwv61qxghkCyTKHv0OkPgihlxC3VhsfEpmfI4q/XYEMTNGxKTNCczZgF4isKHCzawr8o9b6/31Zw76kg1nVehFyNkwpmBhLm4TrzY1TbkidAgI7SBTyecFwKsj5yjWhxu+kvjzc+zkaBwaU81Z0mcI1vmdGrtXxRLM6WS2FVq7V8qZBB1BWn4Oc7eYvkYYipsWFdjyU/sW+5uoLjgxozYHMf7b6RYpI5EuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 16:09:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 16:09:57 +0000
Date: Tue, 28 Apr 2026 13:09:56 -0300
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
Message-ID: <20260428160956.GC718365@nvidia.com>
References: <20260427134659.95181-1-tzungbi@kernel.org>
 <20260427134659.95181-4-tzungbi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427134659.95181-4-tzungbi@kernel.org>
X-ClientProxiedBy: BN9PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:408:112::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e698e7-65bf-47b1-6826-08dea5409776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	54AYvgJRndRFx1ZI8r3SQtJ0OTtqhBXmd+vXrOfcE6aG+8LH2ljlSuCMgvr1M8gaG0LhSyf0BCtp1jwVtrEE5MOswQpm+fmNPFlrzeg9CufnSKv7F2A0VEgCZkCYM+4wHry+bSG+Kl5cd0o6RzJanqYQ+YNVjggNRaMf3BvYjvo4iIoIeRBkAZmr9tYwPmPXKLie0UP8jvLzhIJmzxLvE+MtzgdlBcfoVcj9noNU/yGjABsVto3P52/AJGNbhWy63GudVHqlqhODGgcfrGUW5CPcRS76Rt7BGlqeNgUPuXt0wG1Ku2CO5Zr3x1Q+D+ZOxRDxM5GhH4yFIEh71Mf2rvYLo+yKV671/eXqjZI/mOueQjIbizgAfW4mJclqgenEeno1D168xEEfWqZufb8lHRc2bMQDwKJTLaX94w8I8QsoX1z4yQvjDbG0oNmlDqDX+lzizZO4oHgav7G7MYNNqFpfpOLgFHrJyb+Dzy1dvBHvzSHfIB4dXMZfd/14FsfUISj/C7KS3DfoiwSo813zU7TIY4Q+ae08P30n/swn8sUEkGEVlDBkcpxzXtsWYMFwF/s8ImCL0L7j5kxd8U0yLGVQ6zWKyg0lBBEt/dx+TBKNzXk3F58DS45U91y7WD4xad8CqlS6+4IRGDz3q7e4wi9ctKG/jh0iJBOr5Rgjykl4MN9Rl+hkXidyWgNePDCEJ12/fdmSCpbp1TicIR54VAiVaCZ7H6TOYYkvkcsEY+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f9LP9oUhsbbQrxI1Y8mc1GidFbYQXIvHYKVz2d8PrUmIj5yxZcG0loZO+Rzn?=
 =?us-ascii?Q?mWR/QuVaTYjorELSaJRSMvvUQ/2LtQTLpsn9hF5eSJqsEiI65z9IPrkpgN3q?=
 =?us-ascii?Q?MFdqhxZrV3z9tk39cdf2aP7mXYr6Gqvv/U3iMwB3QWMgm5RLSskR/dUU35nm?=
 =?us-ascii?Q?4+uyfxmOuQ13mtqAbsXQpcx8mNJlXo6O8/mmBr4L9QaW/mogY36Ajfzx6Cwf?=
 =?us-ascii?Q?HjXI03OUOMO04lYjVYyZINilSSbmIsy2VDtxXz1H32pTfIuxBSHGSIeJ2oen?=
 =?us-ascii?Q?7q2nnMM9I4Tyt9J4SAsk/w07Xgm8IvGFcOYj2GMre0WOX5sidCZEGJ58llXB?=
 =?us-ascii?Q?u1y2h+R10n1y6kBfrgz3vVBT3KZwI0Q7VCWEmEFS8hsOGvw9vIY+Kdiy2OGw?=
 =?us-ascii?Q?i4x3JR/h/i3bSSnlc3Q8Cy7fOri7b7Y5hu6ZrlYLg7bIc148oXM50YHKbkdE?=
 =?us-ascii?Q?r7JALr0iE6BghADdQ9HzRZh7uWNi/wD2GTAZQAxEszJvaR8M2Ensylna2gJ3?=
 =?us-ascii?Q?a1TJmoTnlMEG9mEFCk2QlAxTdjzfpJ8fbJPnUeCwvhJwb+5jp642Cy0CDpoB?=
 =?us-ascii?Q?7GRGcAsIhHpVV0cWkF0pcT90rbZE5DhJaMTpdq1UwaoDrw0j8ZC06io021/P?=
 =?us-ascii?Q?Y3fbvB3FWlswuKNJq/eqexVMrYqsEzbEB/wi2Wa98b5gy49YQupRg5Q++nAR?=
 =?us-ascii?Q?zuJWv3qFLkUqvO1pwkdnIgqNHjkzk9jbvFahgYZBo9fCvE9AHs+197aqNzsk?=
 =?us-ascii?Q?ng9PV5Wia2GeQGbjSJ5v/y0d9V3HtKmpJPXKfP/pctY9FdenS6ob/WcH5H1I?=
 =?us-ascii?Q?5QsIPMHwe6SxnWuLyNF3tq5DxkjW+su6tUoORipvNqy+crqdpFLCcYHXbbq+?=
 =?us-ascii?Q?hBWy7fJY8+Q5o0Rb+DbkiKCwqwY3hwDpsH6jYOVYdlrnHCi0Y5Q+QeH5RkHX?=
 =?us-ascii?Q?5WybXPFCNYMwzpQaes8iTK/IUS5gBSdx/XVl3saI2RHd7BjckO08Fae+q1Ff?=
 =?us-ascii?Q?WXyy1M1hFRRxMKj94wAdBOJCm6YPYfQ/j8E42nyCQDqcfCmgd/VbVZH1SOON?=
 =?us-ascii?Q?ilyzTs4ai4EwFYlMYIoPDvKwk6fhsTVfDYzucfwSRJGBhfL49NfCL4BN4u3W?=
 =?us-ascii?Q?U0tqZZ+JD3GiVM8gb/dxM8vEoEz3AeFQq31CyTnHgRa43NrfiJ9vxHN1s8gs?=
 =?us-ascii?Q?aOQWUAtrHVdWt3LVuFhfail5PXU+ake4is4sgLOr8q2nJs9/xwEnqGIpRAZ+?=
 =?us-ascii?Q?6tuHiL8nVoAAmxy5r4/Pjxw7W3W6XpXoDACeQGLN1BcB2MtJX6DR6ryIi0+4?=
 =?us-ascii?Q?0kLNBXBBOYfociIVJ2BD1pP0boFjY9uGcQKsK2bIiZritSa9sHPmmOXBRZ+f?=
 =?us-ascii?Q?Xcrar0xdJ2VvdcBzZaeJ5PsO1xzGlD7zeHLe1NrYOV+EaC7/L0nY4gEzlHLX?=
 =?us-ascii?Q?xtqmzdPP/lz08BV24nNOIP85Qy4uMwJQaKjNKmn/+01T4v102BU50J4X79WG?=
 =?us-ascii?Q?tBN7N/72ASTej4ODmy3S2jRjbNi+pNudFT+JlNWjoZXv8dMT2xNH4e5xaWmB?=
 =?us-ascii?Q?usr3SFOttgj1i6wssplKkknVT4qqWC3A7YdQDVmo7L/MwponwJgqqKPPIo0d?=
 =?us-ascii?Q?jDyGfyahxhWImzwVqcCjTtUMJR1w62SM/l1xAZGqI4bcnv2a2mWBxf60EBjB?=
 =?us-ascii?Q?MT6szBH2/7Bi2kq1eRj/DRXQr+4pQh5HI1rsJIbBqGBtLYib?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e698e7-65bf-47b1-6826-08dea5409776
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 16:09:57.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vadQq9f+jlUtvXI26tBILuJvVblCWcoSEQWEdzYfQNnRmRY3q1OrgOz2bVlZ7oQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033

On Mon, Apr 27, 2026 at 09:46:54PM +0800, Tzung-Bi Shih wrote:
> Introduce misc_sync_register() to support synchronous file operations
> for misc devices.  This aims to prevent Use-After-Free errors when a
> device is deregistered while file operations are still in progress or
> files are open.
> 
> It creates a synchronization context that wraps supported file
> operations and ensures the device is still registered before invoking
> the file operations.
> 
> The minor number is deferred from being freed immediately on
> deregistration and is used as a primary key to search for the
> synchronization context in `misc_sync_ctx_list` after the device is
> unregistered.
> 
> Performance impact:
> - All file operations are serialized by a global lock.
> - All file operations perform a linear search to find the corresponding
>   miscdevice.

This doesn't seem like a serious proposal, this is too much
performance cost.

Jason
