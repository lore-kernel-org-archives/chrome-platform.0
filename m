Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DBE51D52A
	for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904547; cv=none; b=jUyLU6603ixEcA9b8CPSH5gPfAqWJ0HCFIZAW/IYEzqFaljJ2pTgU0YSK0eWW6IshiZmJliSAuCqg6acQMThZGY6o6aGcYzzy5YkIbXDor7oN3iEcq+sRaP06DhInBgwk5+TBJwnZl66RZ5aXsq0z7tNvv3/n1Zi/3DDNVEzQH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904547; c=relaxed/simple;
	bh=4oUcfn/aG/2LlccdeXopD+FbwSKNU7W6lskF/8Ob8uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Suur5JCvLU3InOCEfrGwyQvVSgeswbuaQUZ7bnLYi4COb4DDYIcXV6kbmvXQNYOt3aFDSgKGzOzP8dEwnSJOow8F3wUd+N9c/VNICAu8zp4LioemjFq7ifkfFeYEtVk0dZxgBapSG0XRFmSPQUnehvSGHW946anzWnJWF+8wa5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ZlJC93t4; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ZlJC93t4"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30b6dad2382so7112917eec.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Oct 2026 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904545; x=1792509345; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzTa31p3mVN/sH8ialORwNcbJ7+oKPie6pSClyvLsIA=;
        b=ZlJC93t4+yk/7Gm33xVJGovrVnR25ogQGjUcqPGPcwRsj2XJ0/PwGpazmYTe6+YaKC
         IZlNPUvbH7F0l9TE6yJOe4IG2PGkAuL3hkY3QqMhiD+0J/K7EeZDt2APIuSNIkqVIY0W
         Q4R43AlXgeZWH6KGE6+btFfActEQaz1PN8W/JzTXiXEJECHC0wzZMY82v9hDqxKnNf6K
         dpGgQJtyQ2tBETHBlEwkcJLh54XAYArmCmrTXNn9ri7JHYGof82Xker+YjwdROtm/Jo0
         2ZjMTkeqV/xYgistLvGQcjQSBcGGnW1N2iBQWwvlitn57f+v40jXQcSO3fmnscixN/iZ
         UTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904545; x=1792509345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzTa31p3mVN/sH8ialORwNcbJ7+oKPie6pSClyvLsIA=;
        b=nAKvLMvH14QR6sHZr8slBRjN3Lr2jyxMlEXfNqDnRQiRIo9eaX5hoBuegk5B7FNVgl
         uG7x7t13bmZvv1FzVoqIN/aaYR0L4siCY2AcKbu0XOIuIi2VAKXJPJ9VikX3oLGUZL7O
         7oSfqbDFUh/suvkMhHSz4TzdC60mW/cMuDTXG5lNGXFnipY8jMYQvDNIxrDt/mBHw+KF
         cU6m5TVLhSs8MXECLvHOqmdKgceDZJ3Ef1NdEA+cclZzraoja3Yt23VZyv0ajnO3WAcc
         m2DMrmsX/PW7aiVHdRqhDB43y/oQ6Fl5fpueudc48+CoVxkB4yJECiIceskrfUmWapyt
         cnPw==
X-Forwarded-Encrypted: i=1; AKwUvByLlkCNNjtXk26fqpVUrPIca+ckaOZfjfDphX4Hj7l6MsE1VkO5FA362VHLcMmCQ72uVTtQXYc9lljqwe20jC4=@lists.linux.dev
X-Gm-Message-State: AFq9FYL1PbVyAm0jaTut8eoYPGeK0T0h0+3tlnVoqXlXJNAhUAqCH2N3
	VbgjCfCPv4lj1zhPQoEvTvbWYKVVYi1kmDAH1FJBcIlkMR/fbUZEx3zYueVgTTuiR5k=
X-Gm-Gg: AYBFou249RUmwewWdQ3Q7VHTrruiyZtawrO9dC6zO/Qc7ZPOpUgOwKCLGozTiGMasrD
	o28u/fD2cDvOidnoAIuLl3Jn9HmvDbu5GCUcq9tqNQvQ8kf6hJ4vzaSqq7XXtzNphokyxIMyIF6
	OS5drQe9h4dOedNsBd6kODDbTUleTIcy8xn5YCF9tD4Q59ONtadXDEKc/qs5oQzCqAVF3TDvLh8
	LI+FV3vh/P5xf+hoSFXm34ytMoFVcwFxUjXjOlO1Byxc0byD7EcHPgTTFlLPqPS/uT9TenuM/mI
	R1U0sloTBNtdCo9K3D+8PJbMOSXw0MBwn9x+OE38OzHie+ENRAQLchN2DVOuHNp5aRnSJqiO1Mb
	riZH7TfWu+DZvPMbWngRs5qoQ+TDsewQBbLqzmQc6OGdJLSTJI5oXnkPBBINprQOnpWvEPiKFeO
	PFpbdi5awtA0rufeDRrdaT2WoTx+Aw1d9bumvEUmPX79herFlxDBW+D4NKPxcvS6hUFXKoXlpvU
	748w/bzLEXvhuE=
X-Received: by 2002:a05:693c:895a:10b0:351:1e72:7470 with SMTP id 5a478bee46e88-3537e04414emr18187121eec.13.1791904544676;
        Tue, 13 Oct 2026 08:15:44 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:23 +0100
Subject: [PATCH 2/4] Input: misc: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-2-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=2702;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=4oUcfn/aG/2LlccdeXopD+FbwSKNU7W6lskF/8Ob8uY=;
 b=Os3WfFvBA/IGfHGvBo8P3yLDwk4fQu1+7P1UF52NZo5URi93Zzs6fHaSN1TE3h7WSbX2hxsK7
 h4dIysiLhVCBQYdMK4hWkNpieqUR9Lrjflv8qN83NRWPV99bwlmvJcC
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
 drivers/input/misc/atlas_btns.c       |  4 ++--
 drivers/input/misc/drv260x.c          |  2 +-
 drivers/input/misc/soc_button_array.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/atlas_btns.c b/drivers/input/misc/atlas_btns.c
index 5805a1a3bb05..e77e53ee9d41 100644
--- a/drivers/input/misc/atlas_btns.c
+++ b/drivers/input/misc/atlas_btns.c
@@ -128,8 +128,8 @@ static void atlas_acpi_button_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id atlas_device_ids[] = {
-	{ "ASIM0000" },
-	{ "" }
+	{ .id = "ASIM0000" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, atlas_device_ids);
 
diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b..8a3d74d65d63 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -640,7 +640,7 @@ MODULE_DEVICE_TABLE(i2c, drv260x_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id drv260x_acpi_match[] = {
-	{ "DRV2604" },
+	{ .id = "DRV2604" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, drv260x_acpi_match);
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 064243677fcf..dbf86ea778e6 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -603,14 +603,14 @@ static const struct soc_device_data soc_device_MSHW0040 = {
 };
 
 static const struct acpi_device_id soc_button_acpi_match[] = {
-	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
-	{ "INT33D3", (unsigned long)&soc_device_INT33D3 },
-	{ "ID9001", (unsigned long)&soc_device_INT33D3 },
-	{ "ACPI0011", 0 },
+	{ .id = "PNP0C40", .driver_data = (unsigned long)&soc_device_PNP0C40 },
+	{ .id = "INT33D3", .driver_data = (unsigned long)&soc_device_INT33D3 },
+	{ .id = "ID9001", .driver_data = (unsigned long)&soc_device_INT33D3 },
+	{ .id = "ACPI0011" },
 
 	/* Microsoft Surface Devices (3th, 5th and 6th generation) */
-	{ "MSHW0028", (unsigned long)&soc_device_MSHW0028 },
-	{ "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
+	{ .id = "MSHW0028", .driver_data = (unsigned long)&soc_device_MSHW0028 },
+	{ .id = "MSHW0040", .driver_data = (unsigned long)&soc_device_MSHW0040 },
 
 	{ }
 };

-- 
2.53.0

