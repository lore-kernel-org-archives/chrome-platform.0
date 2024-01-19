Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4ED2376E
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653819; cv=none; b=doXLhjW2Lx2/U3CzIqobqINid6X3ieoXy6Dw+sbSgGR4tz7T7mxsst9CvBZSYMs51ihgWeBWYbOQLdCp8ZoIF28BRmzx1vurpj34lrsMGEvDYtzPUtMi9uPK1uviH7SI4cZMJRnxdiJMCGrUHwtOPUF8hKMuSGURu2cisf1KFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653819; c=relaxed/simple;
	bh=osSLkFHxCEi9lg/snRlEZT8CPmmDwFp84neEb75c09c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLfzWtQ/tsCgzFLPyiYijLIlGwMGdulctNy59fherJ1J3Cp0j66agizbOnK+krXCH0bAsRJZGmJeGcMaMoA/tTOd3vMyiaB/nptM6gIRnOfX2o9hLN5K+bFkemvQ7xVZjkU77Lcoq5y+xUEs7owDiZvF/VGTwKREhu/2ulz/zyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cnepBkd+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cnepBkd+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eac018059so676378e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653816; x=1706258616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LriL7tXJHljhDBH+IF5gAskdccX7dSP4qzgOWwB59VY=;
        b=cnepBkd+99I5uj+UGI9yft1v+hoi4LBKh1q1ulOWyVu4+H/uvrgg0Vh5ZSFtOBSt33
         3TKKng0iN9GnytzIus3TO7XV37KhXx2DDHRQGZDM8IS0KKHIZLs0/pzpkP5QYiKJsbPN
         X89Q/WOKFUw/rngezXVTt4Hy92+MN1Y4OBBlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653816; x=1706258616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LriL7tXJHljhDBH+IF5gAskdccX7dSP4qzgOWwB59VY=;
        b=MIbGPmeLrk+erSc910C1zJzbQIRcqX3I4bUt/TIzaJHH9E4MYTz3HxspQNQ6lrJgd7
         PtqB7uPhEHYfg1vo61auBcn06RqegOIDUAdfXhe5hvLZzaP6rKLoqBgxcCfl19dB2A/A
         7/wIvYMkejOfCDcVzrGWHulmW8/vxlan6RsZXqP8L+gL1UNeuePglOuRJguTFcj6YHmS
         Ojupyb1k+yKbg5wVVAxK+RJgON38PtToBjgTiO5BvG74zvJNPtgspZ7P5c9SXzZOvBXA
         bMS8OYIaj4D53o+X8DDSLDG4vYNcXC/IyHh08egK/hPULuBRYJZIACMYaNDd6o0yEpLW
         ukmw==
X-Gm-Message-State: AOJu0YwNY7hzei9AFQYVU7FGCAkx5SFLT+RBOMdRqkHkNHtUrWEuTjsB
	FrW9nnCgNm/6yH5P0Pq5Hx3JKRm16yID1zN/Wne5V5FHbSIMvysdswmvLZbjtQ==
X-Google-Smtp-Source: AGHT+IFTIsShTsLVt2WoGAE/70+F7JfM4Qy0jMxOp/f9e/N031wHAWuBBM0NHSRyhAcB1H6QiaSrng==
X-Received: by 2002:ac2:5627:0:b0:50e:7410:d293 with SMTP id b7-20020ac25627000000b0050e7410d293mr464015lff.135.1705653816543;
        Fri, 19 Jan 2024 00:43:36 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id q23-20020ac246f7000000b0050e6aff6630sm905591lfo.152.2024.01.19.00.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:43:36 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Lukasz Majczak <lma@chromium.org>
Subject: [PATCH v3 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
Date: Fri, 19 Jan 2024 08:43:27 +0000
Message-ID: <20240119084328.3135503-4-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119084328.3135503-1-lma@chromium.org>
References: <20240119084328.3135503-1-lma@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ChromeOS EC-based watchdog as EC subdevice.

Signed-off-by: Lukasz Majczak <lma@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 603b1cd52785..4996220ce64b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -91,6 +91,10 @@ static const struct mfd_cell cros_usbpd_notify_cells[] = {
 	{ .name = "cros-usbpd-notify", },
 };
 
+static const struct mfd_cell cros_ec_wdt_cells[] = {
+	{ .name = "cros-ec-wdt", }
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -107,6 +111,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_usbpd_charger_cells,
 		.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
 	},
+	{
+		.id		= EC_FEATURE_HANG_DETECT,
+		.mfd_cells	= cros_ec_wdt_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.43.0.429.g432eaa2c6b-goog

