Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC7043849A
	for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620467; cv=none; b=OzGMrTFHIA6O2CoQ5qWFW2k369nf/9snuJmzc6fooVBwsCQTADbfleG4kvguPoNI9CtES2EF+1d9Jx6sfdibsahwxbWG9KFmyKEx++MKNBGMgk0/WKaEVOuIVY7Z2dMSuxXkf6O1tyrNBwq+g9s+vspQvkV4+qcn0ysPY6wQFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620467; c=relaxed/simple;
	bh=k0D8mghOQr74tTyVbSbMDMu8qtmXQ7oexCZsNGmSAYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mt70VPGhwfvyGasd2XmhpAIdiuTzFKlXhoYhMp2AJRPJ/OuiLeIcf4wMLoCNAlv41QtSgAzoISGvJ9JTEFf4kuvsT0Rb/Iv5NxWYFTeSuTxNArJ7iGCz4N3Q4xSRoIiCmcISeOaf+stzMAA2Sdhy6LMmOmlaHJ2K6V7JgsspPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f9mpzyxu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f9mpzyxu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso124148255ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620465; x=1785225265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=f9mpzyxu+D4G0OnQm7ZeYvP9LueOuAfgXrIpWUD7KC2arx4X75v1DceX4tLmlZ/tkf
         4kR/FfutfFoHJe0Q+3YcQjIRyXzl+Y+poCtDAipIsKUGBdidFf+PC5Oylre+6W5GyTsh
         SC6B/6SJdsNlRde8PfacBJN6noant4f3IlwQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620465; x=1785225265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=pEcVYl1BT2wSqqCUC5LH2D7yj0N8zc99WMpE/2SblriYtOVwRzxVKMQWZ5LKC1PIHS
         Pg0XDRGGKAR5q3xe9FO0504xoSokp80sN4Hq6ZjtJ1sbXekkQWaKeckgLN683ekM1wN7
         Gzj0/jUoyCgvI8syldZ8IV+XKTN9nrXTgAWQycclMUMmtY1wTd4mXxxhsp+YH13RZ1o3
         tSZYWJdw0PEIUNAO/X7ZYeGQdYgjn0sOF03EK2Xaw6jK/nYqoJKIYfNmB9kApcgjlJfq
         MXxC/H5cyA8akl0Yaa4I77ByDVT7nxR4Ge9mhRALIcSOxHGW2eA19btFH9B6TsmscQX5
         Vt6g==
X-Forwarded-Encrypted: i=1; AHgh+RrOlQpFDVpW/2cEtIOPOAScPog5Qed2cEXdFm0z6c5nh/JQ31JKJswALvs55CIeha3eoZLjUyA4qozUb/uN/P4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMzwZJNOhTLZQHYbtR10LLOswzF53U2WloqNJEPdxAJECqU9Pj
	rOEZm+fM0x7oM82+Yxl8Jeb4TKBMufqcyoIPA9QmD7U3mB0cZmdaZdrQA/SuZSf2bQ==
X-Gm-Gg: AR+sD13/4Bn/07juF7OinE0K4ppheQUasNCNftloZMoaK82tYpD7o3g1gZRWvbTp5za
	3G4CPH2JnwY1Y8zYciey54SEN7/plCxW4LYjcMKqeXVqVcx8HD/iy8QonrGMhlqOm1DO15447B5
	8JJtUEFysDu5pM6TYjfdBeOebUv6jIlb2WcKjseMGqLLK+C5FCRkkEEmD9yehw3xF44/BOKKQ2K
	Bc+AX4t7FCyHgNw+0Fs1ko63SiUF2YIQnUt05ooaA/YNIMYhDnqnpXYKT5CSYY42v1Hw5XEiZeo
	sGuNgqJ7LDQkthJt3QNI0eIRmzintxHi3T4JTmQZXqKHcbW3+4/y7Hh5zKBRn60UBR4pNddDyyV
	hdhcCu46+4V61dI7dkeR7QHj3E8/dO9xqMpos8OrQe8Ca9klursE4d1mqLbr+C9ZTzjJfDfVJld
	yz7bZAo2jXyNNOR/liN4Dks7AuEYYUHOh22YCYFQdXJCzo5Z9FmZnk3Ge7vqc=
X-Received: by 2002:a17:902:ef08:b0:2ca:5970:732d with SMTP id d9443c01a7336-2cf349d0276mr183734525ad.41.1784620465520;
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 21 Jul 2026 15:52:21 +0800
Message-ID: <20260721075226.2347933-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.229.g6434b31f56-goog

