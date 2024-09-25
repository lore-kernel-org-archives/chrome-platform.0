Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6E13C8F4
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281524; cv=none; b=KWlbfTJ4FiPED+ihBOEq/00C6SWicYbNzSTZ6rNSGBdiQzL0pkH+TCY2Q9CuxOeKpsoxikHDyxcRsnBbx5jlUYpK3dVsN3yLaDTtX704bTi3ZDbros7t97cDzjUFbVaVDP//jTcPzztpFdA7iaqkVC/1lybs1xGuSnI70rOU9/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281524; c=relaxed/simple;
	bh=4IztXoDnmzedD/DGGwCbWuMnFco0zL0LtDzIkgaMdFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsE0nwJrDdAxKEq0p4VDrwQufVwuTT/JnJQzS9vnIdHocBv0M4+HREjt/KD5QOD4dHEAxB+sQG4txy7ekB+OHVFIrWgoJgnEZW+q7NNJvkVvewQG07L/xtEL1/FJeQeoJRKLej6Bi4fR3Qx2v0P5lVKUcIQIv+P7NZw/XzzfaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hGFAzjZ6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hGFAzjZ6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20792913262so81639395ad.3
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727281523; x=1727886323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FZ5g7QcrBKoaqiirz8r6L7CjueOS/LSXhKJhnt7qrY=;
        b=hGFAzjZ6Gz1j5zzbr4fJqABRe9gvKXtf8FNLUm9f957zbB+Lcecxd2jkms1plj6tnN
         AqJ8Re6X8LbIsRbQeP8lR+IXNmWvGX+ZyyGGzMZLyq+dL0YJMq4Rfh6Q+ox+gbkRcvMT
         XFqL0VmpN3lNEFP/6yQvelIZ1I7aaIu2nTQgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727281523; x=1727886323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FZ5g7QcrBKoaqiirz8r6L7CjueOS/LSXhKJhnt7qrY=;
        b=XPf1nUMNzjFrBJhx32g+AUBz9UbzDsBTkCGOwgvVqbz2CVCGPPsZrCWetThmg2Ce0h
         6d4ZMf/pOGHx0Sw6/eRiJY5OuIHVK1oJI0N+UhRMOpKQILAS06V4OGUJtRjrxfG6emEo
         ejG6tWwgcGHymJIS1AV2NMvzgIZdaDq21y6kbAhuJDuy2DTIAsjgf5pN5iRKed1GiERi
         5mS9770gYf33cVevtD8U6312jkEAFUVlY0nvZIlDPvKcTFy1dauTJyXTrxOfh4xJAkAH
         aIN2eQApLzl4LCWK+X8ACRgMGC61/HbSe2tX3pq7bjQV2RBF83XowDxXzPB0nv18Ysal
         zkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKh+a+Hf07csHzH25YEw2RmzkcGs/dxdLvNUe3PWZPn/schO3K0uOI98fK5Do7WdF1rnk2njD5KQfsHLG4RLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiBIkjsRgj6kqLVM1zHUYni3nXvDdGiv37QalZxC536r20yIFf
	KjCSu2mq3y0s39cpgu6Pu8XTj/V0R/t5c1MRRLxgcONQ/8NbgBU6SzZ6Pffjgg==
X-Google-Smtp-Source: AGHT+IEuLsG3mUIBakDR0Qtj5wgz2xldoqosHu1rfjf/OYnO62itqm43VkTh6/qg5gZfBIHNmBOf9A==
X-Received: by 2002:a17:903:1cc:b0:1fd:791d:1437 with SMTP id d9443c01a7336-20afc415addmr48913755ad.6.1727281522770;
        Wed, 25 Sep 2024 09:25:22 -0700 (PDT)
Received: from localhost (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20af1858b4dsm26217325ad.263.2024.09.25.09.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:25:22 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org
Cc: jthies@google.com,
	pmalani@chromium.org,
	akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] platform/chrome: cros_ec_typec: Disable auto_enter
Date: Wed, 25 Sep 2024 09:25:09 -0700
Message-ID: <20240925092505.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925162513.435177-1-abhishekpandit@chromium.org>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altmodes with cros_ec are either automatically entered by the EC or
entered by typecd in userspace so we should not auto enter from the
kernel.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 drivers/platform/chrome/cros_ec_typec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index ec13d84d11b8..e06a0f2712ce 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -294,6 +294,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 	desc.svid = USB_TYPEC_DP_SID;
 	desc.mode = USB_TYPEC_DP_MODE;
 	desc.vdo = DP_PORT_VDO;
+	desc.no_auto_enter = true;
 	amode = cros_typec_register_displayport(port, &desc,
 						typec->ap_driven_altmode);
 	if (IS_ERR(amode))
@@ -314,6 +315,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TYPEC_ANY_MODE;
+		desc.no_auto_enter = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.46.0.792.g87dc391469-goog

