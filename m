Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035333CE9D
	for <chrome-platform@lists.linux.dev>; Tue,  9 Sep 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421054; cv=none; b=JjujogBqNSZjpVB2pFKB646SZrAT4jd4ubHHz9Mz/gFnowpQig7IZB26fPessle/nmLxJR03MxtmGde4A8YcW6cqo46+hHc9bMLpSVQ/UQMNsF5WGEFesuoLsY0OxSzF85KqixjQPHl1imRIxqDAbo7kTsJhJYBga9mmUprzUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421054; c=relaxed/simple;
	bh=wo2Nci5KTZIZbP8CX9Xb4me0P/T5bVmP7HGaZVx1QBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUcThuCD0P9gu4dqxKJKNmCCmaMHtYruSAU8Z6KADDO5im5T3T9l5Rrd64zVbwClo/URphpNmqYVhvS4IAmRfo3Ymt+LJoEDX3+R4YZGGmmPe/42BbjcyVNhX22AcUwQEr1xL8wRt2gNZQEpQNQAOoa86eq66MLw/LVxWvOEXK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YtesXnHV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YtesXnHV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04abcc1356so495362466b.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Sep 2025 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421051; x=1758025851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeRnafoqGXMQLsLwS7RKCqhJvzceHCqSnadqMFnp/Eo=;
        b=YtesXnHV0XPyTkNrua1qwhAniZT+MnOYkW/L/5Y20eQgoZJFAFkDKw4S0BbwcJfBBJ
         FKTD9ICGerN12M/aNEPFdEAYGvaQcpEbFzgIY3qungmABKc51LTjtjcid0RPpaSsqOmc
         lys342YGaAmNs8w8DLO+43a9m8QUSTwwPki+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421051; x=1758025851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeRnafoqGXMQLsLwS7RKCqhJvzceHCqSnadqMFnp/Eo=;
        b=SoOBjIgPmlZ29QssSSsLIm29qgYz8/7msdxKqCH6YeOKokIKWx7m460vzxku6D6/R0
         7u2Nav37Fy0gsFEb/MWA67lLA+0n2+aRBGej7LXux91srKAhKztYGnrt7sBBZQwla4x0
         tBHqoq8ZlC/9OhS4ENhaN7rgDUmDhl3ESSTu4+K6iThurrTquck5N/Xh22vS2tPcsc5x
         xc0k40b3+icCtHj8LB6RY9h2GH033tyUjyySWXVqI0ychwW8oeIGuQvgaNA/+cABUSZM
         hu+LTO8uU67Z9dVsYRX5CQy+rN/y0EkHtQo8vslW0U273S9RGjcpNA7VH0Sr6hXTBTxu
         vJXg==
X-Forwarded-Encrypted: i=1; AJvYcCW/qfU3FrGP+5YBGQsZ3OxT/TMsPKxXnlgsFhgkv6soN3/Fu4CTwg87vV1+EiRtjpOESM8ENQPHupR/b45woyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrX5Vmtbbx0tADmXjB/ElIV8M9rE1/HZ4+0XxXA41y6EjQYfTR
	g33TmBw3E0wRxQz+Dyft+qgtG4H4wEFYflE4iAT1kZgsmo4HEcpxrhZXLnBdzjgjbw==
X-Gm-Gg: ASbGncunJzHxasSlXz33J341d3e8V+J4BMKiwrbzXAN18xJt2uW2PkJI17HBXqBdmMH
	JMG6rb9fETBR8lPciAVX6mhMWwR0UGZXUTO9E2+FaH5l1tMuxTgSVzyqRaB++URFlGoH6Bdw+KI
	T1XbfiL2A5Nn6cmNzGn60HwgPivNR41QYKEOtV6xpXbNpWXtpZmsCWZ0MGnfRSCQH9Ny3GUFAKO
	FdMwplfTt3BpCE3EZjsb/BGqATWkY77+sLH6DKs1OneUe16A+6tMyLfHAHU2S5PKnwhpw/ubcQs
	6u5W1mWc3NOS1Wtar2KveuNfN/Cotw80g6kZgmXdyqNAUqxc1Fm/VVATnGguIJvYEufwAKu2nZP
	gWu2lEXJCW/UZbOhTflIsAdXNg4KmY/ev9M6cqVk1EGYZjJWeSIyQM2WkV5HRo0Og604h6p5+VF
	LBWpQZ4Mfs1mh5sBsE8WotgHdsGQ==
X-Google-Smtp-Source: AGHT+IHum5WD472d7fS2rBLDEJ4/Qj+9NWbX7rnTe/jOnY7UY4cYm3PCK7sxMJpUkyS12VpRXD21hw==
X-Received: by 2002:a17:907:9410:b0:b04:f5a:8c13 with SMTP id a640c23a62f3a-b04b14b37c6mr1069077666b.15.1757421051199;
        Tue, 09 Sep 2025 05:30:51 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:50 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 4/5] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Tue,  9 Sep 2025 12:30:27 +0000
Message-ID: <20250909123028.2127449-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.51.0.384.g4c02a37b29-goog

