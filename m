Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF881991B6
	for <chrome-platform@lists.linux.dev>; Wed,  9 Oct 2024 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728500167; cv=none; b=JbQRzRqKUhaj/DsOMxdRr4nIfuQv/E1poIwwykS/GCM189jroYiAbowzphVFHtXYZpm8EmPDnL7DUv4jmeUt2ileRvRDC/gc759G0xCHvlVvU+ycW63ffbi8EFAloydeCMWcI6p53mw4vb40Ehyc+Z88aHsBI7vDuex2K/9q+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728500167; c=relaxed/simple;
	bh=bDmdoVXY7CIoUgvBCektb8QqAKjFivIrLKLaMALmR8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BgyfIVPLwpedl3hVEz5ZmIRvQwAW745tCY6y4YEJomrIXO3vxTMnAMG3oqEEpeSgmDMAAFRP0bQBpJfKg8yoA4ywqzCRGzTV+E5VL4o1QTvee5Gl+V402t9tRGuqRQwMf4/mtzReJYnThrgoVMaifB7P6dlP2g27bRQ46UDi1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLPcMoXB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLPcMoXB"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d41894a32so81689f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 09 Oct 2024 11:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728500165; x=1729104965; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zIpvepU04vQBrfFdCPxrz99wuy/omHJnmjxH9oK+R3c=;
        b=MLPcMoXBUYnhsAAN1F/lnHBPcE72faMeeR+XypkMygfBcsS9nBjxVq54YmH0aZrOHI
         ywodejF0U/BxibjYOfjnHfqB1O8fpuo928oLFRLIQGtGksPGaJ+6n0J2IZpQosWCiqWa
         mxzhb+LTk48rwv35q86OjOk8v087m/7wQbcbJ4EHh+Gk+7O0FT2gmr305Bo5nUA87Iz6
         eaLMin5a+EmuQ4ap/YASnR+50NkCuUY54kzahPkP4jugxl1fkT4FviGm5xN6POGDm6zw
         re8h6HPwn9Bo7ko0E7npMYv8u+bJ/5I2rKLFG9StPjVyNk711Qc9GRWH/HoLgSNqs1ci
         Y8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728500165; x=1729104965;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zIpvepU04vQBrfFdCPxrz99wuy/omHJnmjxH9oK+R3c=;
        b=iGbJjNIVsxplg9J/9V67/7If6BrKjKOtmkZp0wh/eDhRPdyk8b3zLutUCHPoFFtw7R
         QytcyJFsox9W7X3lxpmQ+l8k/bvQ12NlpYiHHfZlC1BVwHnYK0DZWZo7SAtZm7xAbSZx
         H6uK41SkiOVuz6DllcUfsYZzVHUD4G+6T10f6L7diR32RvuoI0XBCTBjgnFyaNQCtNev
         7iQo3vM16RgkjOTtk9spdnpa3e7xUshjr/kYv/5UjRUZIJhL8Zbb+nsG7hRIiwLPASwh
         OQBqNHlDHgR+53H7s3IFUnbmo5GYaX6Gk/SprUi1Gtls5iUt4JuoMp1Mkop6TGQQ7b4G
         A2IA==
X-Gm-Message-State: AOJu0YzOMxGG4e1oxVMZl+FoN65dWrDdp5FD28QpdM4EAWNy1ateYDSc
	+NHzYxk4c0YL4f76nfUgdJPJS647hfBzq+jqKGLGaJTPOWn6i6tl
X-Google-Smtp-Source: AGHT+IHse50ItBhMs4WbNWj7zCSStUhkgvCUXnkFifblSKxOnGbsgqfGOAg30DPZ4LeSggMA6sQ05A==
X-Received: by 2002:a05:6000:12c7:b0:374:c33d:377d with SMTP id ffacd0b85a97d-37d481d2de3mr535398f8f.28.1728500164528;
        Wed, 09 Oct 2024 11:56:04 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-268e-1448-f66b-a421.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:268e:1448:f66b:a421])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e606sm11098835f8f.69.2024.10.09.11.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:56:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 09 Oct 2024 20:55:44 +0200
Subject: [PATCH] platform/chrome: cross_ec_type: fix missing fwnode
 reference decrement
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-cross_ec_typec_fwnode_handle_put-v1-1-f17bdb48d780@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK/RBmcC/x2NUQrDIBAFrxL2O4Km0pJcJQRpdG0Xiopr0paQu
 3fpz8DA8N4BjJWQYeoOqLgTU04ipu/AP+/pgYqCOAx6sEbrUfmamR16175FGN8pB3SShhe6sjU
 1RnNZ7Rrs9RZBZkrFSJ//xbyc5w+tKpxncgAAAA==
To: Prashant Malani <pmalani@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728500163; l=1888;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bDmdoVXY7CIoUgvBCektb8QqAKjFivIrLKLaMALmR8c=;
 b=EmUsMKkTErMHN4XM+jmurxP4+C4URCWyPOGoOx1wI8mwEe4xW8V9rGPTrAe0arwMzUPp9AxQd
 VbxhZp61SbaAUJWQym7tAgwREsrnndOM0fPqTerlEO1e3dCy5Vi0vkE
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The device_for_each_child_node() macro requires explicit calls to
fwnode_handle_put() upon early exits (return, break, goto) to decrement
the fwnode's refcount, and avoid levaing a node reference behind.

Add the missing fwnode_handle_put() after the common label for all error
paths.

Cc: stable@vger.kernel.org
Fixes: fdc6b21e2444 ("platform/chrome: Add Type C connector class driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
I usually switch to the scoped variant of the macro to fix such issues,
but given that the fix is relevant for stable kernels, I have provided
the "classical" approach by adding the missing fwnode_handle_put().

If switching to the scoped variant is desired, please let me know.
This driver and cross_typec_switch could be easily converted.

By the way, I wonder why all error paths are redirected to the same
label to unregister ports, even before registering them (which seems to
be harmless because unregistered ports are ignored, but still). With this
fix, that jump to the label is definitely required, but if the scoped
variant is used, maybe some simple returns would be enough.
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c7781aea0b88..f1324466efac 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -409,6 +409,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return 0;
 
 unregister_ports:
+	fwnode_handle_put(fwnode);
 	cros_unregister_ports(typec);
 	return ret;
 }

---
base-commit: b6270c3bca987530eafc6a15f9d54ecd0033e0e3
change-id: 20241009-cross_ec_typec_fwnode_handle_put-9f13b4bd467f

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

