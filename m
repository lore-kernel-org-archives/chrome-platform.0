Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE2217473
	for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323752; cv=none; b=Rw99wgBEGYbvz3aggvBpj8HzPdXH7kgfkjpRJIkRaeHYJXj+Oktr2K9QbsGlcPBKdHt2iufgn+w0KwizZ3l0a7ceiYfJTfjrPbU64qb4iDwuz9t2VzuPkVVeAluIhdzl6YCua5NE5W8myIOOqcdfC4hEUWLHenWPVQblZrAgE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323752; c=relaxed/simple;
	bh=pmjvhjw4ANaGJaaJIPAfAMKeQBbfRAJ7IKjlQWEKmyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ug845MLcQ5twCFF0C3OHbMdJYlRtgPsAnv1OxjNdD9BkXj8oLIp7s5/Rc4lvhC1l7ljbJVyhXgzMwb1l6ykLWbXUQgsGyLtFfO5Fdem7gyDOJPpnvi0wMrRehFBnBi35vRnT4HUYmFWV8FqrvSi70vfPhNyq1cu5BL9WKE3S/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WxJGYu8e; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WxJGYu8e"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so1149913b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 30 Oct 2024 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730323748; x=1730928548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKi+NPRYmwJ2A38UY9R/topls2qQmTfhUwGCoXEdFfM=;
        b=WxJGYu8ePuY7xFSp7R55WkNaXcL/iF7P/Mj/In3wpl7WvYLnqo9yVbVmLellPsHOLg
         WiDTUJWJcfosY3f4Mo3OSmhzoRGGYZPrYnIeLAO2iISiZsGZyUlHeura3QRf0vBg6WHc
         jQROC8Wm+p7AmKpPXGUK30Ff6OLbsfQIwjRGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323748; x=1730928548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKi+NPRYmwJ2A38UY9R/topls2qQmTfhUwGCoXEdFfM=;
        b=dtj6BPYGEhVcmfneTms6PULScdpee1EtHn+4bwG4RCXW0CMiJ98U8D28agPufo+gZ8
         52britMul3dfEEVI280eJhquSiynuP/xrJFTFrjbCQpgmBJwgBD+JtztTBly3rB/7TvX
         +NdzUvo4VUInVr5+arfU//iicT2sUv5Lm4hNBXRIXofL3jUUcAPgYgYUQ32U5qQ/lNB0
         f21vgBSHRbyvnAPRkJd6N6PrausVG+KVfEnHIz7TDpxDodjgu8dnKI5z6p+OtfnwO7Ng
         s56v9MKirisy3kL6LclnP4AS0azXpWPI6sM34348810NcbYxbDUxCW+eKU1gNw1a8PFS
         quuw==
X-Forwarded-Encrypted: i=1; AJvYcCVnspxZZAef1S46MBep5tAwy+4ZMKi/Y6WR+aFJH/sWzObEo8A09bOQcjDDvL5KewcjOhfi66FtwL0+pa44Oio=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU7+Z9MmzDKnivlHP/RuPMMmDE8L9tAZkO/G91KsZgazrhbCqx
	Rv4AzwXaPyT0LCCiEw0G59SaL68Ogq8DrM6zE9wpfPfZMqqjasWnBaeCMO/uvQ==
X-Google-Smtp-Source: AGHT+IFzsx/2nziVzAA3aVi8a7q+nlWhb2DtVPBhQAAbTqwOb89dC8jOYaMI05+lY1hky0mFR4od6w==
X-Received: by 2002:a05:6a00:2383:b0:71e:735f:692a with SMTP id d2e1a72fcca58-720bd1a046amr139794b3a.14.1730323748323;
        Wed, 30 Oct 2024 14:29:08 -0700 (PDT)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7ee452979e4sm36885a12.9.2024.10.30.14.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 14:29:08 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: dmitry.baryshkov@linaro.org,
	jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] usb: typec: Only use SVID for matching altmodes
Date: Wed, 30 Oct 2024 14:28:33 -0700
Message-ID: <20241030142833.v2.2.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030212854.998318-1-abhishekpandit@chromium.org>
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mode in struct typec_altmode is used to indicate the index of the
altmode on a port, partner or plug. When searching for altmodes, it
doesn't make sense to use the mode as a criteria since it could be any
value depending on the enumeration order of the driver.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match

 drivers/usb/typec/bus.c   | 3 +--
 drivers/usb/typec/class.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index aa879253d3b8..a5cb4bbb877d 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	const struct typec_device_id *id;
 
 	for (id = drv->id_table; id->svid; id++)
-		if (id->svid == altmode->svid &&
-		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
+		if (id->svid == altmode->svid)
 			return 1;
 	return 0;
 }
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index bd41abceb050..85494b9f7502 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -237,7 +237,7 @@ static int altmode_match(struct device *dev, void *data)
 	if (!is_typec_altmode(dev))
 		return 0;
 
-	return ((adev->svid == id->svid) && (adev->mode == id->mode));
+	return (adev->svid == id->svid);
 }
 
 static void typec_altmode_set_partner(struct altmode *altmode)
-- 
2.47.0.163.g1226f6d8fa-goog

