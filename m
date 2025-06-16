Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E62877DD
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080796; cv=none; b=qsnXmiDcb4Dd07F7ClFAgIIsz6PqEdF7YOlUjQTyULUSj2A6OaGZzN7KFC/sL6ISzTv3c2ao/8RCA5IkwugHtGUlqmcQ79W5YGVm4iGIo64elXkCNHB47uNygb5lVKVRNTB7+/4vN7uPirQWEbNRw65SSMBWWpjws/yT0lc3vTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080796; c=relaxed/simple;
	bh=Zr0by00gzuLqU/8noVtlHXiuZTGL3C9qQp8UPrlTVhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdELwBxVXFDW2bPlKBm5RxyGAVLL3ohm9koMtK2acQMomxjwZ8UFMhHtKHdkb6cIKW3ah+LAp7x/nJ6eUe1dtmUy1uQzvNxTpEc9ucFiTsIViF/tVswNwp5NNi3Xujn/2zlsCdAkznwjeYSzGE6ewoaUiNbdICMOq/EOqwUkTUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dNo2XvWG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dNo2XvWG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso8094858a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080792; x=1750685592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=dNo2XvWGREtApt8tmyTjvi7sYnRyYoqPPyY2CEI987Qs10/sJhn8OnQ211OZb6AK5T
         iQTwxIG5kg5QcwuPyaCzzZrQFtXSrxQE9QHQdOIxePrJUWHTPPhoTB8+EE0EOwJop4df
         ADp0UY2r0cK/saL7EyfYvGdeCfnN4/KorQ9Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080792; x=1750685592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=DIjWj/8jGYf76cLhHguy3Kz4nrXLPhBZ56gzRb/bM/NYcvZXpova9fCUcIJhDPAp04
         o5dy/GxBJoZSbo/2XlVK9gbNU7YCClHggG937FJ3JAhW9fvVS6LFUcQmINtNuAWqvbPn
         NbOrZaa/OW48Wnb5UYuJh8UNaYW/+7JXEleePrTzfGlgh+6E7FXOhb3szl2s3+SQy5Sj
         S6/NiSeKPd0N5mh4gDQYSmReKwg0t1R2dABJclZIAHFF7gw7EQ9JWoEiAb/YWUFjXXKZ
         g1wA9BZhD96h24+YpCkVasaGDqGVdxPAHgBjfX9tLi19TQbhg3CVX0YjcieDUUewMENB
         xPOg==
X-Forwarded-Encrypted: i=1; AJvYcCU+GRh+Zl9hB7QIzhHolHUETt/iiTpU09TzhiDtEmbfh8dBLwBYu2Ijfy9jmIk6uGFj8vXMrXyiqcTGOh4fP4E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK9dYTGrIunYXL90Jr40KxV2/DraIAdR9RPdGUk4AEbhaD4m7Y
	lzbUcTJteyCMnwl1t71dhaVoBIPZ+cWZXoWiL/2s+pwDMHlzlPJUqulGs/QZBoF0Wg==
X-Gm-Gg: ASbGncscuHE9q/n2E/HWYfiRm3GRetVlKzJ6Stc5EEDMSYyyF2zj/imJRcj/NJAKOSy
	HS7wTurumJ2WjgCkFnyJQp8ztjWZs3B0v/42y1IQncucY5ExYr1wbYkVn31YVhrKqeD/PXDuGx7
	jg+HhsuvAHBCtDrpScw4dfcebGB2B75Hf6tUw87GlvVkfcfpS02a68FJdIitmhcGheISN6Tbfi/
	/2lQqVlWZHPNkrOlj7LiOuANVO558ZUv3xO2SwHcgLl7R7+UOkbvU5/AS+7NAS2SmRB5dY/TNrq
	hrTx1Sjx8amdKrCQgqvgAFPyCp7RjPzkObgWK6ztvpbxLV8thiVOenX7F3caNxAMWOfSrh6NBbT
	hTJU/mAHETaB0LBupSdDqCp/HMtjSE+tj3dz6AxE6HrxGXgHJOTCnvwPKd/q3ior42DgD
X-Google-Smtp-Source: AGHT+IHjZH5bwhZ1Xd6IbpKopcl9AXhlpygAbGOG0etGiJyiXrgesebapu3fw6k5UbnpFpkYC/Jj0w==
X-Received: by 2002:a05:6402:5113:b0:607:ea4e:251c with SMTP id 4fb4d7f45d1cf-608ce4c0fccmr8482617a12.8.1750080791872;
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:39 +0000
Message-ID: <20250616133147.1835939-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
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
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog

