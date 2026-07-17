Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013016.outbound.protection.outlook.com [52.101.127.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0337A3F4103
	for <chrome-platform@lists.linux.dev>; Fri, 17 Jul 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287352; cv=fail; b=Hr5B8K4vwbfDacxvc3p4Ku1dblmGc/UlCzheBwgq3sgpdb8Sy94gfsQV5LMc8MDdAhlGpAzRRaYy9xmE37gTq+tDkrNmB9mZbpuS1DCEENzRckmk55eniFEyonAgWboQcg0Gu5wTtWzyl8eSyyZRGEti8iQIGQlFEYBwuoI2lpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287352; c=relaxed/simple;
	bh=ZeOnSXIyA05cmMcT+AIJ7aoM1tIHGUoWFy9F3KvpWiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GcXeMDswomPzFD2ovvKPjlnGqn2rG2VJnTUocYJUHbeiEn5Y0JJbRxqaEGXAlxYGomirbIAKYWEdIkGNKTe9m1JKXca7sTjgre73krnl24PB5BdNTfeOOlHwqf7odEjwuqTCkL6ZkaaE8JZehoFXyQ9vgRb8kQ2SZ8+ovequqk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=eGY/z3Dg; arc=fail smtp.client-ip=52.101.127.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="eGY/z3Dg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFSuMo99aZpO3PG0SD+tF/5B2BOHh+6NQ/eONlN72PGJwonJBaO0uVGncxZlEACBv8DrrY8C7C4JzX5YSz+dDUgnGut6wgiQECWkOG+k032HqhzPOV1HbNpNr/wdrFqZGpZQUFrBhZr+86P1ezjq/IxIwRT8FFSMLFV+Or2Z5QNsDPEJEaj7TUKnQtHVsPH2J5it1wFNN814Cvp0451yy5+0xBGAm0VwI0VzBamwfCuZaQ+ZDY0VKyQtcOzEy6WeRLLL4gX87u6Vk+ZukUh3hh0fj2W1s8AkN6dDxjmJrhOBuCgZHGGKjUWasWF7mZXcvSx1yiSANAud0nJz2jJ4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHOVTR55WKT8iXJKmOqlf7sXjXpXYsS9DKjv60gxuiE=;
 b=RSziKFQmBcQTwgTYtcVhWBZC7DneekcaB5Duf2MwWIYtN9vKQp2BCL/AoZTfXTQwQ/H2nugX5sT4V0hS+OJ9zVXfu/FoWRTMn9eRgyBsyQROMDX4eUcIctZP9hxuVdLb0n5mbZyvW0u0vmJ4TZU3D/5uCrFAVAC5musSEBJqFSRkmj0UB7zu7qcAVyW3FcFq2UNgHOp2HgKN+l2JRCsi7f1FP74JXJt5eEJOAQ9TPur6gPvvLal0i6p0DGZQNKsgsVmGZqxk1dqWU8WTyC0L29jZJWFjjFW98gdIkLXYUlxgLPov1tjGHxb7j2GTeNqaqhAqfjOzpMJx0gK4ZqSlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHOVTR55WKT8iXJKmOqlf7sXjXpXYsS9DKjv60gxuiE=;
 b=eGY/z3Dgw3dAwjfZNGZm/Mnvfu4RaKvuu3kU/XFQn3FB15LYwiPZ6MpmY5w4HF3c9pexwDx5EA3jH6z0VGM9rYauR49AmTm6eqL0hbaJjTEkN0vaQqr2SlHDHQ10fo3xgLYMgBRC0eZfS/hJL7/AiYrQd0O0d8gc1+Hc++jn1SAMU/HWPQ88oE66V+LF5l71v4YgDBUhqQa6RyGEHaB14Jb9UjSBVGbJOyI3MRD1H+txuZCX1w2q808P4arcL4XzCtYsbJ9yUzUj9ejLagPYb1TthAOqlYf/rivUTS81U64YRclCJdzwKtfgCvhBiGIhWS9+oOMSOeFFDek/S05E2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 11:21:57 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 11:21:57 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev (open list:CHROME HARDWARE PLATFORM SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/7] platform/chrome: Remove redundant dev_err()
Date: Fri, 17 Jul 2026 19:20:40 +0800
Message-Id: <20260717112103.213017-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 882d8563-ff93-4e75-1b06-08dee3f59cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|1800799024|376014|6133799003|56012099006|11063799006|38350700014|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fYrXA51XBPiwmYGx61xMVnHtDluEDnSS/D8uV+HcYFn5Ezbtzw+UPMzpHAfbcePHz5i8bfxgTEi+uslw2TfxDLIlIrAIInH3kkyPnJ2jL83gK17PJYhutQ+c0hCZbspqHLwriCJa+pJ8q8rmkY+hv7pVfnRJR2a0gSLnaybYGPOXXVCXXcpnBS/nddb+e/DSgALxO3+0FnB3q3Ijgxin13KPbLi1JeJ34V+J1h5mpdyW4VbmSjrDyw390fXhn5HfjZSi28XP4lIA/i/KVA4JjkKQ23EhSKuaVBOpEHVb8nGHzD3GEgUyRZLGcLDVqzKN99CZk3t93ZZYFQdupX/5nYjRVYlf8Z0QaipT2C9MLbRG6BKjH2j5mY+ddelqbJOmteMHPDjRLyeLx15Sf46yqCUamIhszcbS9Z1riaBHY9idY6mNPwtCrNVtp5rYBKshCpKlXkN0es1WR7l6Rw8yMGQ1Nj/bnmwU0KMSRBY2psPNZ856iPmlJiGq67P2fxBBHzTL6OyHmaWmDumHw4VQZutoOtT+mpi7HfchXo4pnja4el+ic1HtMMS877z1C8k2qSMyVGOvepDHiY5hI4e1h+1WfJuDFXzXaDyv8Ofn6ftUTRmkZe7vCy63uVFkBqQk0QwL0aZjVqSHU1P6a30xOx05o5zbN7IwLB4i7mUoh5/rebFjM8btnded1uvVWHcGUEjp1WTOmFXLh7JKmShC1N/W3uAd4kfB6RU9iTelhAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bOtepuwbZf2BdkWr1hCd0Onn0m7EF020SZ27jVbN9ljIm+cJyJjPPflyW2jz?=
 =?us-ascii?Q?HfXgq4UQu7Oer3rufdkj2UQbhZHLCayqF+o9z0edJjJKyCS+lI6VmFYkh0yY?=
 =?us-ascii?Q?mttfEV/4N2YCnxRstE4JSFqYoEarXWoesoy2K+iRQrFCg9W2gFgQRRBcDwhs?=
 =?us-ascii?Q?voG2aIRDiXLI+E3v14AotImV3eRZ3GR1JO69stbUV9Aq8olKk7yE2Ie38LwV?=
 =?us-ascii?Q?VFoxGt8R4I1PPBUo5db9WNkg+vjUsi5fsZzpdfVMbWXBPd9BgznP2ugbDi/o?=
 =?us-ascii?Q?4K/+JBtFk5Pouc9Xe7cF61H8z80n7YXMW+Ff5CQqeWxvJ680KhQuP9QB38cy?=
 =?us-ascii?Q?BnyugifuasduI5BN/mKx3znhrtgV9vtzVpIlRI27aA7oUxapKjBsRbHKcWMn?=
 =?us-ascii?Q?WCS2ixPFkBCrusxK3NOhEdLgC7ussI2QRbngjzhALGL1/vqUIyd93XhZJ6Xe?=
 =?us-ascii?Q?dIWP6g/fOCBdmfOSFpNY2vH999zX/Gn4FE5/4SI4Sx0wp4oPx3DDT1p5HigY?=
 =?us-ascii?Q?xCI4HDFlX4FOEWZ7DFVgrBqxdARjc5aX+/9ZWhBd09Wk40JU3eXQUt8y8a1i?=
 =?us-ascii?Q?shfuaNFTv58eetdzznchwboHNWJ5osMAxaSj1JDlUgZWvrX8BNYVuc7C6gJT?=
 =?us-ascii?Q?rdfDyuPKJakFwSdkTqyUjsAfPw8qe9LairbjLL7Xj0gIBB49ho2ZaubU+TpU?=
 =?us-ascii?Q?73imOTJx4VYyFjBVM1B+ojZ3aS586GBp9Ab4Wu/JYiJUAYCdt2MLHBjwXgBl?=
 =?us-ascii?Q?3EG4p+Q6n940uSVjZpIhV0nCkC+dsK0h3r0CzHlWxeFgMq7iIEmq7JvNzNm+?=
 =?us-ascii?Q?WTML6+KTgHWbe//1fKLsL6Sugj8m9WoLYhftrsTSJUvP71hyy5YOSl+A3cWT?=
 =?us-ascii?Q?QBK03VxIqnKzgCS8ttcbeyevk6ysj9o57CPYFzW1a+NhMW3+MIcnlZL3QR9Q?=
 =?us-ascii?Q?5oX5y0CGQs1EjFa4358mt7TuOKSEJnm3vWqUaS7ryTFrM812rZRIbLCBDI6V?=
 =?us-ascii?Q?2hNEJdc4ZaQgh6wGkyq/VEw739eCEHeFxmeerPtGrfsIMcgceISqRxvQxhuv?=
 =?us-ascii?Q?YT3iHvQ/IFWkefl7eIT/XySaPXEipZoWMETldObKwAY/HHID4F9sUe0klyLU?=
 =?us-ascii?Q?2bp78xh/be2IkVCa2ecbrphBrGwTgCn7ZqMp412TAYRmmzMggjC4db1OssUC?=
 =?us-ascii?Q?CTtc2iRcc2aBENywC9KlB7XDPxTHugTpNfRDxBHhquVGdrydHGJBpWRG6V4S?=
 =?us-ascii?Q?1FgIOr+wPvVbl9tVZthsSJXKxx/2WNHKgzTg0hSAQPwgdO/vFN25T42YcE3I?=
 =?us-ascii?Q?7JBVvEqi07cMrl+ilSVuKfUpdpZDJLoIhzskuHv+QGPcWR6RCNgEvUXQsDwf?=
 =?us-ascii?Q?rHADXKtGJGDD9jGPDEUKmGqPWGfBpnQ5gbcZHhSiSbYVlkSpbUGzWyv0982Q?=
 =?us-ascii?Q?Jqtiak6iD5xGmu4Rl7ESBQLB5Dve4x/4sCVhRha6iDoTaN9WlsSJz14Fyt+q?=
 =?us-ascii?Q?kI18Y0QklXKY6wB8W8XZw+k8hzChawWHkbHhEoxcG27iyPfpjaPd9gTpHr3e?=
 =?us-ascii?Q?vldRb0FKco3xHf+b26tSQL/0tJ/pxdj5OO1j4vYEfOyyVTfCEZE2kUV8g4ii?=
 =?us-ascii?Q?1UNVb81xa7x5aXQDkQb5s4weEBNIZUIJKqAdqO33oO7jOoV+NEvE6/zk+JSO?=
 =?us-ascii?Q?mDUfC5BnwXRbLQsuE2hSqF2Zkmy/jL/WsAdsFVZZK0cdGtnH/HPPy6RNrOlG?=
 =?us-ascii?Q?ZkHgoG6+cA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 882d8563-ff93-4e75-1b06-08dee3f59cc3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:21:57.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kDf5cfHpR3N3eqC7CvzVQwK8fVT07+/nEfKoJjkzjuovxpylLeBaTUIQ5vXEJnYaW3eb67sPiARNGTKkOe2Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/platform/chrome/cros_ec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 1da79e3d215b..5d0f5a9187b1 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -249,11 +249,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 						cros_ec_irq_thread,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"chromeos-ec", ec_dev);
-		if (err) {
-			dev_err(dev, "Failed to request IRQ %d: %d\n",
-				ec_dev->irq, err);
+		if (err)
 			goto exit;
-		}
 	}
 
 	/* Register a platform device for the main EC instance */
-- 
2.34.1

