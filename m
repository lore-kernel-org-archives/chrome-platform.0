Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304821B010F
	for <chrome-platform@lists.linux.dev>; Thu,  4 Jul 2024 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106408; cv=none; b=PMYzWpcXwH6vondhbr+QJzVSKySZOr+P4+L42EGB+ubXXRbZFGC7crPpG3ToSUe11BjCdfwKlGu7Zop7zEy7hWZpHaBkOt7TELMBcm2/cUM/lljPaI8kzbDtHu8CSa/T2Wy9NEHOfE2BuoB/yIx+1HFoaA+68HWlurI2pWeBW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106408; c=relaxed/simple;
	bh=LRBnNjsH1CyBlK27vH4HjxzagefLojGK6jhHT2bCEms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IceWCq/3gnhTYi4wIMcHoB1Q/kB2OkGps6SjuD7ZzomomhlKfC2KyBiL9ea5uU1R6ZA1be9a3E6SILea7ttlIoPdwzpsTd/q6CIgupuTeP6MyMKdeMABLMpgmn3cNuWfj1PzqBJg528W9X5zyKu/PwIvEUJK3JezwR03RgVqQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNAyn/X2; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNAyn/X2"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d5c32840efso891175b6e.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Jul 2024 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106406; x=1720711206; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dDOkW0PAFspV1Nsbjh2zbZUyCnV1dEkHmg1HqSY2cw=;
        b=oNAyn/X2D6xDW8avT0Zpv15/AV2yp5V//jvzj8WXsk1IHskJlesriL/zK5idGu+9cu
         Ty7kJ4uhCh0xNpMDq6KO3UcA6M/o+flRTRuILt1pJGeNhqxju7M8AuT+w458zYuh23KQ
         UBMVOTY+NR84wx6a2Yf3u03zxKyaUvFOkJNhdlSJ6WSuFrIDVl1AIpeo3sbJB5M6n90K
         +/itUiylU2dV3r9WxQNmvS+08M8FGymeCHGtCCC/gcCzJuBAvTyNt9BmpJOCqju97THW
         iRYt18jZiDeZ4vm0tO4wvVXCMlFmiF/InxKqtPKoUJQlGAZRsgCuT4U/l+TI5td9yT2X
         FI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106406; x=1720711206;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dDOkW0PAFspV1Nsbjh2zbZUyCnV1dEkHmg1HqSY2cw=;
        b=RsOfsCe/xJeKl3rJd25Aw0xqNpY7SGtUabiKSd7OS4Tt4ykXfku/hps47Jj1KASqk+
         8PEknlrd8cdA4tq41HicUNRZMFtdNpxUMPakmh6lem5hexzK1xM0lwWqK6IyBTYv7Czi
         Mo7i0KYQ5iBWMfX9XKuiChlI4TC+vKEZTfXEtmH83OZhofeHVtvFqp/ZnneY9N97axDe
         LbLXkifYGvLiChWEnJhBkXjBkWh/phMkQ5DcMScK4oFo+DFe61GwQuLXrINrJS/fsxjG
         Dlc5WxRQzjiLry8oIt6H8f+kbsojQeyCv8lGl5q/rMOy/uUiFsbX27gf48ha66EhCZio
         O2dg==
X-Forwarded-Encrypted: i=1; AJvYcCXsnUdIQse/Xk7VnivAoD43tL1f9sWYV+de5utK97HaQGGkdplqiL2vOl/t2DHzLiwxczcaoiQKKPSijfk5DlcP1irWHNwEP57TbbBIjnVq
X-Gm-Message-State: AOJu0YwGNgQsYj2QDT2TF2BLgLdw++BbHx+G1YVEmCMk8y6vdp4xI8Ba
	zC7C7NrkQcLrG1Ijgh7j3WdWiX04axRGXh2d9/SnEaxvICzTOfvSxArIh6dhF6o=
X-Google-Smtp-Source: AGHT+IHHk3pE4TLFr7KRVvJS5XlXRIKfpvIedOe6u7433gzwuERp8u/tr3qO5KeYVUGyta7Gx3L7RQ==
X-Received: by 2002:a05:6808:1404:b0:3d6:2bab:16ca with SMTP id 5614622812f47-3d915b0c6b5mr771492b6e.13.1720106406264;
        Thu, 04 Jul 2024 08:20:06 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb41f77sm2484567b6e.51.2024.07.04.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:20:05 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:20:03 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sre@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] power: supply: cros_charge-control: Fix signedness bug in
 charge_behaviour_store()
Message-ID: <ZoWKEs4mCqeLyTOB@stanley.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The C standard is vague about the signedness of enums, but in this case
here, they are treated as unsigned so the error handling does not work.
Use an int type to fix this.

Fixes: c6ed48ef5259 ("power: supply: add ChromeOS EC based charge control driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/power/supply/cros_charge-control.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/cros_charge-control.c b/drivers/power/supply/cros_charge-control.c
index 73d7f2dc0fa3..3183a13eefd0 100644
--- a/drivers/power/supply/cros_charge-control.c
+++ b/drivers/power/supply/cros_charge-control.c
@@ -204,14 +204,13 @@ static ssize_t charge_behaviour_store(struct device *dev, struct device_attribut
 {
 	struct cros_chctl_priv *priv = cros_chctl_attr_to_priv(&attr->attr,
 							       CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR);
-	enum power_supply_charge_behaviour behaviour;
 	int ret;
 
-	behaviour = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
-	if (behaviour < 0)
-		return behaviour;
+	ret = power_supply_charge_behaviour_parse(EC_CHARGE_CONTROL_BEHAVIOURS, buf);
+	if (ret < 0)
+		return ret;
 
-	priv->current_behaviour = behaviour;
+	priv->current_behaviour = ret;
 
 	ret = cros_chctl_configure_ec(priv);
 	if (ret < 0)
-- 
2.43.0

