Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF018C321
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381048; cv=none; b=YIgjIGq0d0+5gOSMDZ0ZOd8gFW7E4fdPn8hMPjns3Y3NdqAnmWMMeKFzX1/W22owK9JxmMpCL6kwDDzboHCO6vymvVrBNQK48eV+fDdcAYja2Y2R+ycUTCZ3kW8E5iHiiqZuvGp7EZ0ViMlYwDYStADb7W06ALH/LF5Eah7/emE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381048; c=relaxed/simple;
	bh=zeFAAnixERBujmnP+OfMoylgALYCdPQWy5IZUOiSTn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHRkfR/zYhiKpyeqEfhg0BNWupz9tU3rim2AGj5+oLZsixuoJTaw0qyyl+lq0d/PIBy33wgKQ/vWeIe3XCPD4qK9FVKilLWEAGUOjzpp3yRYpRx+94pn3AAs5TeDqX/ex1VtfGCMLrzETV1+mgYJ+TP4qBDYua/ScElSKYtsn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H/wBSOhi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H/wBSOhi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86859e2fc0so624692366b.3
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381045; x=1725985845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1529kCYToVWA/SvyL2miiVbvfe9UVSeUX+iIF/erMtM=;
        b=H/wBSOhiVGWhsExQRgEK3DXgi8aKJGOt9x+jXS5VLdps2c5nt9sVyK/+pFTsU0IbeV
         DYCjSv2k+q4yPHmAj3MLYah7iwtSzhlh7DoaAX+BI6ygr/ulkVKf26kUp//ePja8cvu/
         l8fm/TxbNv38cBQS1NDTJUcJwaIlOvRhAvVvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381045; x=1725985845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1529kCYToVWA/SvyL2miiVbvfe9UVSeUX+iIF/erMtM=;
        b=rBV/zjBA0aoDXVdTpbzYGNzRUA5Eoe+JDarzDqhB+YOwNWPAWckvh8gWVg94cIwCfi
         lM6vlGX+ApOxs/NF+GcEFtHXZT1D+Ec4n+fJ6kMNu8spK243EeSlZUe/tmxvUCxvaxNk
         5X/0TRy/Ck7nQN7Ac4KN24/nYLiwD1vGjfExsdEDwFEhS7OXPqx8s1xDvzhYSFIY+xB+
         oBG9/1ANZLuY2qYqp2fglAveLjZBUwPOEgeosJgwI+uATrYMVYgUp7hWb9k5SM+bLSQN
         dFBHxSPLBkd8AseSSlSD1yoLLuteN4qcMnWiFR2QbgH7KG9sBDujqREy1PiKagsiuYCM
         WWZw==
X-Forwarded-Encrypted: i=1; AJvYcCXl0zYsmdNH3ZbycqnW8bmsWfPvzHgPk5ptGRe1rvUau3tr2eFJeKRbCmWo+OBlzypLJ1a85SRs1MLSkC4a/58=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVuun8vvJtUpVWSpyKpRFHNsdxIM5Rk/QzPiyzBUs+Zac8lxdl
	KihmRSEahuGkA54d5sQsrOwt1S8nwypwUmgSG1hSOmxJX7IIQSVsAkg4+2it
X-Google-Smtp-Source: AGHT+IE98mHJ5UpNz2yGMEBg9I4YslwHEn6KQq1me3zTIU0zpG7qP0AN3s2VlMVbsPYfg6dglKz0Dw==
X-Received: by 2002:a17:907:9690:b0:a86:78fd:1df0 with SMTP id a640c23a62f3a-a8a32ed8959mr101502266b.34.1725381044779;
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:44 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
Date: Tue,  3 Sep 2024 16:30:32 +0000
Message-ID: <20240903163033.3170815-8-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Load cros_ec_ucsi driver if the ChromeOS EC implements
UCSI Platform Policy Manager (PPM).

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e2aae8918679..d5d63df7fcbd 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -108,6 +108,10 @@ static const struct mfd_cell cros_ec_keyboard_leds_cells[] = {
 	{ .name = "cros-keyboard-leds", },
 };
 
+static const struct mfd_cell cros_ec_ucsi_cells[] = {
+	{ .name = "cros_ec_ucsi", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -124,6 +128,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_rtc_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
 	},
+	{
+		.id		= EC_FEATURE_UCSI_PPM,
+		.mfd_cells	= cros_ec_ucsi_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
+	},
 	{
 		.id		= EC_FEATURE_USB_PD,
 		.mfd_cells	= cros_usbpd_charger_cells,
-- 
2.46.0.469.g59c65b2a67-goog

