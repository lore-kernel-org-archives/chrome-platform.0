Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4D2D7DD7
	for <chrome-platform@lists.linux.dev>; Thu, 21 May 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371919; cv=fail; b=KRspPxxaibZrGRr+1Zkz3ASGs1qknTBJRwFGWKuuUK1is6ccrfmYmoas7He6HYgE4vBzyDryoBgPUbMS2+n2FsXk6yk1bB+wvo8JyE+5KzTi2ATPeZgfS6MTUiEZY8kJ8CGP4Z/QzGy7zJjdCxqfe8baG4t4IuKENVbIVN579xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371919; c=relaxed/simple;
	bh=uyLoa/0Xv4bBBivF4VbvWIq9Nj7WChYanfaGqauUaE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mxjsGaFDcrJjVDbsHR0DgR7TPURnsUxq3Zno3AffS76tAa9qlwRqinvFySe670RiqXxoC/qg3SC3WLkf746mhbw9z1lYHocXQgt5qRt8cyx6RSKDtw5eCg/9Scx1qbx6/sP4Q5BFmg9AveqCFNHaN6P/kOjKFYaOPDXaM8OMp7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fTAsvhQ2; arc=fail smtp.client-ip=52.101.48.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fTAsvhQ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kti49Jr2KXQkZTuvVqxwEQnzgSdK9QNH7iO6nRyzo/OLfH1gNQOpOrdH9LLKorCqOkLrUbq8oqQQ+HPiC6pk9v0KdCl41Fbc6DgqVuOjAG34BJM0yyRFC6SPUSTreGVDiPU8VDK7hZy/fvV6LReRoIM/zLvCKYyBp5jFds0/e6bpluC0ik5X2m0cStCKFq1C/TMMC1r5zj0tDMY517gH3zTrK2pa8kqG0sA1KtlftK19ndjCVyYdodjVKciKH0wydhU0oir+mKgD5prIpF79HAuM1ZRqSdWQIRv/dycVJjjSwuc9Bu4XsJazam0KXS7+JS7Axzcjs/OZuFWqlK9KSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I35lc+nbKDVB2c4SavBt8JulyNtXVllU9DG0GgydGKg=;
 b=DxParRxqotOi8L4UPFZWBJNXZzcJTKmoMmy787VDvjfUmhlQrEpcEK9qATwGwMaCuQVMeKY6ScEniZQMVvN+Uk4sCHr8daCJS+qUHX4rFvJIaDzMnAz6Kmw4JOC8hn1F6+0QAGzWjEC+1kW/9E0lAuSGEaR8RDpAprPzEUOb+xuVaulpInAcu17gTY1x3cVEkI+c0XZovhRo7iEHXaRBAHq0B20q01OzJhGITBJiCtgDV5UymDgDepgKluI12Uf5FTSxBIUvLOOjjb7FFaO0ihbV//oxs1QJEVSDG/Xf0dPFRkkrSpJuq7lN+s6ERkWpTNVAHBX+1KfGptr+l7HKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I35lc+nbKDVB2c4SavBt8JulyNtXVllU9DG0GgydGKg=;
 b=fTAsvhQ2zD8tfTRWMz7d5PERVL/GxrmjnElepXqe9RCIcK5oevLPTQ803qLn5X4P2Q/3sio/qbiOEfYPNit7rW5QmJxumzT3bRt1h4m6K+GWQ5kHD4melm87Gmg0V57FCRDZXcCJOrUKzv/w+hqeSNYKz8y4z46YTZgRYeV8H4hz1ol33dXJ8OLtvc6I//h2Dqa39V2kuZFxKmHC5l0aSyLTN9H4sVJUcGrOZKdJAareT6lfzzIrP1gksMnJ8S9xkcmxPj943bcrdvZliMK8aV+JK19W6Cy8c4+8E8pBgoRtVc8u/zPEUxmWzTY7P7PWS2xUmAIyw2kpYIt2+Bqh+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 13:58:31 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 13:58:31 +0000
Date: Thu, 21 May 2026 10:58:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] platform/chrome: cros_ec_chardev: Introduce rwsem
 for protecting ec_dev
Message-ID: <20260521135830.GH3602937@nvidia.com>
References: <20260516143017.18560-1-tzungbi@kernel.org>
 <20260516143017.18560-5-tzungbi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516143017.18560-5-tzungbi@kernel.org>
X-ClientProxiedBy: MN2PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:208:23b::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f7b852-74e4-4846-10d6-08deb7410aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	DN01EnqBU5uiot9p1//gW/hmo7f0VddJ0CiGjb2Xyr3Hdh0GS1KWllPPBOjsVaFc1g1CbQqKrRjwPAmv5BUJF7zNOJsZIPFpHA04FQBDndSZFTpH1NLVIdLer5OenfOXvl0NUrTJy09qEF8uIjs630EA97ZJN+OA4/EKJzwv4q1Q2ur6aBkfSnN1frmZYcMBM+wx2zPLU1NNNqLtK/MEoIQwIGJpWsEN6238lMVSi59nsCPU7SAewdGjbzuvU5auL/6TI3FIcNm0T5SjcsYOHbmRd/d2P6u2fmDPgPTmyyql5HuI64WJOUYvNNZ8G5DHBL4u6Vfee+JNKZSp9+maxgz44XjvbL3gAC4HCZBTs9nMTMag3XwrXD/5RN1CKXWoRKSmcpPUJ3RpAIfH5cl8Ac07/Erqn9T25MxYpJz/RAyrqrr1Fwmz3NKkM1nP+v9tw/3JmOS9BvCN4mVE1/NI3CkyPpvi9+6ztXf9roF/oOfLDUpcpB1ANIasMOUdMvnHBc45AL3YJc0bdNvV5JLvSwvwz4v3rMgDGlNZurMyF8EXsD4Nb1jELeBQ53F0/JXgcEC5mZrjOnpYcuTRvzcMmILSXEkKp4Bly+5MRPJ0IHyyCWVUHyDGJLzpOp6kkofK6vCbsifdrn1MFajEhyOaBGzMmxKW9pagTZ97iSo+BiHpALHyGwfOeXVvXiCu/Kv+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7oWqeqOjRjJMzul1x674FwKoNKfS/EBvuQ1m1/kXAEesTQrh6jZOi1tE7NRQ?=
 =?us-ascii?Q?91HNYVKsTxgbdZcIDAQ9Gxa2yV7CN5myqtUC7xksM1OIRXxrF2RXrgfF2ki9?=
 =?us-ascii?Q?wRoCjUoppnUhw8t8ShxEG5wd7dma85iP8xDDYUrrTg+HAjeNwSgw7ulpPMv1?=
 =?us-ascii?Q?1I9iJwQAiEloYGaVc6aYJ2rf86KjJpi5susHzz65PldgHH0yH9L423VKXCpf?=
 =?us-ascii?Q?nzeTRFe7v+KU6s28j6dKNWayw+zw6DAP0oJ9JvBOUfHZGvaYCIjpekdiWFLw?=
 =?us-ascii?Q?tQJcjl6eXUfMkfUQpQwpwapO6I6MjCc45nGAYnQhqddKrb8Vjq2MsoqElJga?=
 =?us-ascii?Q?9YUAopaQkcYiy86NcDN7CQh6GX4Y742rq2yhU4nkm3kWG1ins6SJ4PuEXNz9?=
 =?us-ascii?Q?y4j4RhNBW/nwPj0ntJ5hB0ToWd3K5wJlgYqFIN0I8eUWVHVq5JGEJpQJEp/4?=
 =?us-ascii?Q?ut0EagyxL33EPedPtYN79v4vYYLk9gdBeTSnwiL3MepYUgqh46bNr21dXW2P?=
 =?us-ascii?Q?hz+QM3qgcghYtnUhURkCYx3Jfa7Xiqrx20xexJsJRDVZKAZNjZz4YSLn+xnd?=
 =?us-ascii?Q?N78dIj72aRFxhMHL3Zb6kQgVc70ToWCd6WaPWWEPyYCB9ZXxX8HVn1xuWdgL?=
 =?us-ascii?Q?ZoeHHTjDHxE7lL+nSsnva9osBTEh+tyYn6waIIc+rWbYjfwqxE3uhOzogSv6?=
 =?us-ascii?Q?IXoOnXlTbU1UJQqSrjTK3ZudDNKZipSzEU1REbkirwDALU+EIwdhJ1lHIXBS?=
 =?us-ascii?Q?cwMJGuZ7VM38cHF7odYAdhdMhMDsyfWJ9tfcVrEAcxiQdAl9gbxjUa9QGZNZ?=
 =?us-ascii?Q?udAWmJMlxytH/+wMw7H5n9qmYmDuAbQwFWAIGQKv5ZG+dWny57275SiSOMax?=
 =?us-ascii?Q?AXUlYDcyymlsHksdW0X5aosAprxv+U6y0nOlQ6kuQXXRhZlCIJmdXlhUphz+?=
 =?us-ascii?Q?/VXtzF1EbgVLCU+hXQBt7FjCR9u98wklAFkvdfEKYmwZmg3R+RcgwN7fJ1oN?=
 =?us-ascii?Q?h/OW4KoiMa8oLHhTr5zthaDDi3MdT75yK6nBjTnOBTUzp/KOlIBGLgSt9Dr+?=
 =?us-ascii?Q?EkGltstJ4AXryRyWdueyUhYLXhKvnGMjBq9GOrE1vcY6jL8XK6soJpsPPFqB?=
 =?us-ascii?Q?JmHEuMjJr+UfoUgwwKnIS2HGwo6NIqBw7pEYzt9AC9cEUq2wELeguZy2YBtp?=
 =?us-ascii?Q?R6ygHCkmRoeWAgK62HqJ/mjiC6PPoD74xSv31vmKbImADuZqM6mGudmkIKNT?=
 =?us-ascii?Q?rWTXEb8CpDDKWdz9xewRQHV6kYSFczGGJEkwmvlUInokf9fn5r3L19AljOq1?=
 =?us-ascii?Q?io9etTk5MCNyZQ12jwyOoznd5yJiPTU0XeFXQMCUZcBbQxrzYccJpO2hcbmG?=
 =?us-ascii?Q?YVdv83sVUl7Zs62IYzJV6A1/dA3CisQxtb7PL+CUdoQXYbTD4L+sfWrU/jjs?=
 =?us-ascii?Q?onpiDYuSDf+0jLtxxoodyVKj39tz8gJTo49NTRmrWnm6YXZOZ9W8Z3fthhRz?=
 =?us-ascii?Q?+iL5Y+jIyHFZ5k73nQmnwKw+lHS2UZ5K/DY+2hcGAy+7AU0df6pKyQe9HCSb?=
 =?us-ascii?Q?+hno5BMb7xeKgl/8M8AQPg7xcHHQp2dp1cZBD6omElSStJIUFYP5fbeqd5fj?=
 =?us-ascii?Q?9TUAFmFIcYohMg+SAN4Z2soL9ogfqlSJGshQIFvlsXEJRdSJZawO+03J1Pe4?=
 =?us-ascii?Q?9jpVom9eIqREG8SZn8GRd/CFs8O9rydjlwe3qtB+gy0J5AeI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f7b852-74e4-4846-10d6-08deb7410aba
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:58:31.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYzchlGFrWdOK7iBL6ZhKs1L0/VBGkOpsaVBKQQplTrHjkUW3JSw2rkwSK8n8Ljk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567

On Sat, May 16, 2026 at 10:30:17PM +0800, Tzung-Bi Shih wrote:
> @@ -94,12 +96,19 @@ static int ec_get_version(struct chardev_priv *priv, char *str, int maxlen)
>  	msg->command = EC_CMD_GET_VERSION + priv->pdata->cmd_offset;
>  	msg->insize = sizeof(*resp);
>  
> -	ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
> -	if (ret < 0) {
> -		snprintf(str, maxlen,
> -			 "Unknown EC version, returned error: %d\n",
> -			 msg->result);
> -		goto exit;
> +	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {

I would not use scoped_guard here, especially since it isn't used
consistently

> +		if (!priv->pdata->ec_dev) {
> +			ret = -ENODEV;
> +			goto exit;
> +		}
> +
> +		ret = cros_ec_cmd_xfer_status(priv->pdata->ec_dev, msg);
> +		if (ret < 0) {
> +			snprintf(str, maxlen,
> +				 "Unknown EC version, returned error: %d\n",
> +				 msg->result);
> +			goto exit;
> +		}
>  	}
>  
>  	resp = (struct ec_response_get_version *)msg->data;
> @@ -122,10 +131,18 @@ static int cros_ec_chardev_mkbp_event(struct notifier_block *nb,
>  {
>  	struct chardev_priv *priv = container_of(nb, struct chardev_priv,
>  						 notifier);
> -	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
> +	struct cros_ec_device *ec_dev;
>  	struct ec_event *event;
> -	unsigned long event_bit = 1 << ec_dev->event_data.event_type;
> -	int total_size = sizeof(*event) + ec_dev->event_size;
> +	unsigned long event_bit;
> +	int total_size;
> +
> +	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
> +	if (!priv->pdata->ec_dev)
> +		return NOTIFY_DONE;
> +	ec_dev = priv->pdata->ec_dev;
> +
> +	event_bit = 1 << ec_dev->event_data.event_type;
> +	total_size = sizeof(*event) + ec_dev->event_size;
>  
>  	if (!(event_bit & priv->event_mask) ||
>  	    (priv->event_len + total_size) > CROS_MAX_EVENT_LEN)
> @@ -206,8 +223,11 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
>  	ret = blocking_notifier_chain_register(&pdata->subscribers,
>  					       &priv->notifier);
>  	if (ret) {
> -		dev_err(pdata->ec_dev->dev,
> -			"failed to register event notifier\n");
> +		scoped_guard(rwsem_read, &pdata->ec_dev_sem) {
> +			if (pdata->ec_dev)
> +				dev_err(pdata->ec_dev->dev,
> +					"failed to register event notifier\n");
> +		}

open is in a context where dev_dev has to be valid, don't add
pointless locking.

If you want to have an assertion it should just be this at the top of the function:

	if (WARN_ON(!priv->pdata->ec_dev))
		return -ENXIO;

> @@ -330,10 +350,18 @@ static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *a
>  	}
>  
>  	s_cmd->command += priv->pdata->cmd_offset;
> -	ret = cros_ec_cmd_xfer(priv->pdata->ec_dev, s_cmd);
> -	/* Only copy data to userland if data was received. */
> -	if (ret < 0)
> -		goto exit;
> +
> +	scoped_guard(rwsem_read, &priv->pdata->ec_dev_sem) {
> +		if (!priv->pdata->ec_dev) {
> +			ret = -ENODEV;
> +			goto exit;
> +		}

Same remark, don't use scoped_guard. Each fops should simply start
with:

	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
	if (!priv->pdata->ec_dev)
		return -ENXIO;

There is no point in trying to carefully partially do some part of the
ioctl of the driver has been removed.

>  static long cros_ec_chardev_ioctl_readmem(struct chardev_priv *priv, void __user *arg)
>  {
> -	struct cros_ec_device *ec_dev = priv->pdata->ec_dev;
> +	struct cros_ec_device *ec_dev;
>  	struct cros_ec_readmem s_mem = { };
>  	long num;
>  
> +	guard(rwsem_read)(&priv->pdata->ec_dev_sem);
> +	if (!priv->pdata->ec_dev)
> +		return -ENODEV;
> +	ec_dev = priv->pdata->ec_dev;

And it should be placed close to the top of the fop, not down inside
every child function.

Your mental model is still thinking about "revocable" this is really
entering a driver bound context at the start of every fop. Then
everything during the fop gets to assume the driver bound invariant.


> @@ -451,6 +485,8 @@ static void cros_ec_chardev_remove(struct platform_device *pdev)
>  
>  	blocking_notifier_chain_unregister(&pdata->ec_dev->event_notifier,
>  					   &pdata->relay);
> +	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
> +		pdata->ec_dev = NULL;

This seems out of order.

  	misc_deregister(&pdata->misc);

^^ Is first because it stops new fops from being created

 +	scoped_guard(rwsem_write, &pdata->ec_dev_sem)
 +		pdata->ec_dev = NULL;

^^ Stops existing fops from running

Then you can go on to destroy the notifier chain and so on as there is
now no concurrent touches to pdata.

Jason
