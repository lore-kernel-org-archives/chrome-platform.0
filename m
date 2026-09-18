Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E339021A
	for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736525; cv=none; b=GrMYLPc0fYQl+V4iHnKi82eKIjR236qsMD5ubVqRwcgmTUGTLOfuUfEazaRof7OsmvXLEzG9TaiM5oArFRcTeNV21nrxsaf5oeV3d7lmnZNVZMPrB46Hvxq4jRTY6jd88e8yONMTk6nfhfhu/ALwdXYK4wyAVs7U1fC4xzKxlG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736525; c=relaxed/simple;
	bh=fa6kq1q/j0kmHwk4URxaYOv2Xe357GRD8EOADLztHbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ch/OxvBQjffcxVUW+7Lod6pFbIifqQhUCbT89ux1NoQ6/ITIsR0lHVP7G/C7FKa6KgAy7zO/9oHUvFdnsnRZ/rOr8/yTBExmf0YPPRQTXC7rjKBCe98NxywCmPmlsfcNrZWQ58Z6rLZFeF7AsdJIJFB5jDVVIGTxUTGnoEWyKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Y2U+gj2k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Y2U+gj2k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so4726135e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736520; x=1790341320; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=Y2U+gj2ka5TlMqEdsTCT6RETYg1rQkmOtbqrUM7KST8cffEDyxDmMqbURucj1tkYPv
         Eo6qsCTVbAOb7T4monpSrP4pUT+E+xrmFNMuLqSVHGYP8qGhdfRwFknQQ90OnSZ3ikQt
         DOI2wq3oSmLuko1FnZvcWtjUcXK79Mo/Sajd2XO3Mei2ydvdE9a/8i3vu0BpgQp3Q401
         LIAiwVn3xPVTBuv7aMAXngwCc7lXWUyKPHAvQ92OKV46W84YRnkJXPU9Q2S3QxDV2hIU
         Gn9b1gDPm5q+xslGgCR+6IypafwbtyFByUfDpeCcfnjMKvdcBiips3fwHdHosCABADjZ
         VhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736520; x=1790341320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZtkHI/KnMWq6CTlHyr0XTNdYgawafpLs2G6PQA3uwQY=;
        b=NLCMO29sNBoY0WsnFgfPDkVKEcVAPtjfLdLNCHAdd4fdgr2q5u0AFYiSn0xvLszIIz
         dOmThNkBslxhI230+WNUdOe8gflrm+hSr/Fd+WfXu0iMTunRFxju271r36PK8c05D3aL
         vwOdPTawKk8klUIPjUPCH/FjZMUZAmq78jVDQwsIUswsBlwV+G2aieZ3QUmGlXbQQmyo
         TO1oLAKftYtXmg3t24l7b8xTGFmdJJ4EjK8qDqyahKGdEVti7EfHQZIfKOA6kkOhe1xt
         MTclvO0tEvvyFupaTmmne32vGMNDxIW0rgLCNUO+OhysDdHwPgHIxeoOsd4pVcP4DEtW
         0GZA==
X-Forwarded-Encrypted: i=1; AKwUvBzy7t7fD1Xa51YRvjgq/8oC5ZQpETjs5ZZWtdoqMgFfqvZrCp32/Xz6am74CUuqpjElY7MsYzkhS5JJ7XoQo4g=@lists.linux.dev
X-Gm-Message-State: AFuF++l6Fy+0gRB7y6iKtUhXThCzElJqd/lNUbuMIHnecmb78a6V6Cee
	t/ZEYh2EDzXyLXMFCRHfmuUhO441t8f+r7L6CwDMgglkIBymUDpd7NvQq6qT84cHa5M=
X-Gm-Gg: AYBFou2IDEn5ZvF7OgNL9D6y0n2er2hNPxubiVY9dDAoBy1BDKxVqT8pJsrp7Dgl5do
	Z5DS/hwgUvk9ohzyBOw9JHTvrf4PQ2/qfDH2jYpRuf/HDlrRr3KTdnxshS3pFEt1IRodF1pTLmh
	q3Jp9+5y0qYbgAXSjHrgf0/eGMrTV+d+PStV7q+OOlQJkKnPQBJEJA5Uo+521zT7FA5b+MqeDeW
	ENwyRzUIxxVRceYFY4PcoI5GPYnRXRybtlkSvwlhQMH8DI5tsCqldHIUtIp8/WZBjZMhoBD+8S8
	mlqoQcK1ortuIbPjOPNootGeOXEZlYY/jgPkyVIwN7wRm+MY0HXAQDy+Jxi/WFn/O7QUc5ohQXu
	zE4aVJRhvU7J+SDRhlsUlZ4Z2WsTFpBup3rBszHCfTCJYapYQnLi4Lpd5odbcOxU0oyLaj1ywHJ
	gX31FBoHumKpKSNQKwg2vrMTL+DWGksxeGQviyQ0l0rq1PvMpIKKMvBV55PKAkHQag6e5w4/r7L
	u3wbiiAuFJ+H/c=
X-Received: by 2002:a05:600c:1f95:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fc5726c1fmr60894575e9.9.1789736520206;
        Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Sep 2026 14:01:50 +0100
Subject: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=1626;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fa6kq1q/j0kmHwk4URxaYOv2Xe357GRD8EOADLztHbM=;
 b=EYFqwB3JTSDF/v6810RjGhnD5BuvCmTHk4T0POvMYduD0+qDSn25FQg7BXKXC7O8I0YPInY/k
 wW3a/ein6rHDASDulAEy/3FhDJTusf+soHqll38+PQvEAnd5Rrg6OMI
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/i2c/i2c-core-acpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 8f3bdd50186e..5161e8a7ca10 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -352,8 +352,8 @@ static const struct acpi_device_id i2c_acpi_force_400khz_device_ids[] = {
 	 * at 400KHz (as can be expected of any recent i2c hw) so we force
 	 * the speed of the bus to 400 KHz if a Silead device is present.
 	 */
-	{ "MSSL1680", 0 },
-	{}
+	{ .id = "MSSL1680" },
+	{ }
 };
 
 static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
@@ -371,11 +371,11 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 * the device works without issues on Windows at what is expected to be
 	 * a 400KHz frequency. The root cause of the issue is not known.
 	 */
-	{ "DLL0945", 0 },
-	{ "ELAN0678", 0 },
-	{ "ELAN06FA", 0 },
-	{ "ELAN1300", 0 },
-	{}
+	{ .id = "DLL0945" },
+	{ .id = "ELAN0678" },
+	{ .id = "ELAN06FA" },
+	{ .id = "ELAN1300" },
+	{ }
 };
 
 static acpi_status i2c_acpi_lookup_speed(acpi_handle handle, u32 level,

-- 
2.43.0

