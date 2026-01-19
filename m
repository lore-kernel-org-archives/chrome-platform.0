Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4136826C
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828727; cv=none; b=jb38lxmczy5XTabhdZWUpLQtRpEoL05Fqwq80kvGBepJeOgDtwS7jNIds8P9p32qlu8tktOJgStkkm+iPiG1Ij9ctdprnUkGVKOanOi+gusCrw0y0jeNhmpIrPALekUhHEpXGADuH9/wdg6Ldk1PMZcEqwwAWaww6Bf6xniRudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828727; c=relaxed/simple;
	bh=aP2YFO92lDva0e1jN3T5U5hBf2PD7EyvHXkgrzxR9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iI8z0ry+R87g90rWKv6Rwowqs+Mwo90BvDPkYsOZao9cfR8xIMsi36DszsPq9gq0luMp1WHmEanr1dCGKCa3n5oauFXDAYfJFB4NRtF6Km6q+FWDblBk80+7n6nDJdq6FzKj8cWUSdXKcfyCR419koNx32EPVTizVNaoNj/b9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VWxvFaNb; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VWxvFaNb"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-655ae329d6bso5706130a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 05:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828724; x=1769433524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=VWxvFaNbD7KVeRGgawmS0uo9Sc4ojB+ZNTVKWBwFAF3tHxV5blD5IeFm7JN0NB/fh4
         iX1tw3SXk/a5PXdkJ7hSS9Kj37BG+hOiCpmCCKXR+53ybnSC40v+Dd5gt2VZ5BM41fQQ
         s2wh38UI8z0i7pCZdggiS5cQCuzx9kMu7oFPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828724; x=1769433524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=HLBYl39X2GcZkR3FdYLpWNRXehPhEGxfGndUtuwm2UJ2BH5GsLu86dv3CAWBNVF6Ee
         K8E45Fb1bYuoMK2FPTHuRHVM0crV1N/BANCVDKDLZdzU4ImyCrwaneKYJKapHbsjhRbc
         y52UZH5rj3KoZedZAT5SKd5DuTpIGzkcaAX4ZLBNR+5z6kpRPIUsunzKH6n4jdpztwM+
         CdEbd/fYgHZBcCnqhocwb5kJt7GZchDEXizr0erc9OTqtY/OZCFI5xbSzt/XpP9o0QIP
         BjDSDnnildNfxB3SNEpSPE2YBhoq4FSFfHsuYvx70RqsOLgEK2xVzb6KgCqa8ImSui3y
         LSGw==
X-Forwarded-Encrypted: i=1; AJvYcCXo3Xz2swwOFvw0TU/s9JsL/mdWboy6Yjq5rY9596jolmqEOJ4p8De6TnUFOjF4RV3t/Jde9efDr+ElxoHqlmE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3MwWOG+t9zy3FmOOfFlWDWgBxlfGToeiinow6gKHUF7k3M2xk
	zZ/+fA5tNC2qj7YD8nLftacUf9lg8N5+7ABSBUg9zGJEDp4E2gy338qwMvB3gbzL3w==
X-Gm-Gg: AY/fxX7qt3CBcnWzfeh9KzKRUg2QAru/Ilav1+tEUnuD6TjjrF6WFvfo/JwNEaes7F1
	r2jmu8otjst4xrk3SbjQbnm6yC0+oGj90HX7k4eEWnh//SFuQb6n/02S1FdfNB9uv+9uMIrH3Wk
	nxhcOakpN3xq7HyWPGi76I3opwib7NNXKKzKc+y90yS5CY9Yt5+NXmLEdp+8yfaUC5/7jbIPv65
	3OO5M4C5TbnpsTbdS4sWQBoVkzNga6AHUkjLoC4+/TnCKmiEOhI/zRF7pgwvHiPdOhGU9lAYMcx
	SvYNX6+JeMOPXO2Mi7eoHd5WzKr5sb2OmuBVWg8AEEFfkJcQUWV6rVkrKANY8qjI9QyGI0zHMQN
	tPE5A/g36Ash6ejoyDndHUKXLOdWc/Y5NhUAF6NVA9NmV7FJsqfCc1FZ5ZRiHlLhL0ZTxoAyvgd
	4/AF7NRvXjvLssKEdfkiYPHW1W+jy1W7Uovp9LyGIgrl/iRipYqWRbYI16d28B9qTmLI8mU72G8
	ri4TQuK
X-Received: by 2002:a17:907:9713:b0:b80:402e:6e77 with SMTP id a640c23a62f3a-b8796b9da5fmr999144466b.54.1768828724407;
        Mon, 19 Jan 2026 05:18:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:43 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 2/7] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Mon, 19 Jan 2026 13:18:19 +0000
Message-ID: <20260119131824.2529334-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb26..c0806c562bb93 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.457.g6b5491de43-goog

