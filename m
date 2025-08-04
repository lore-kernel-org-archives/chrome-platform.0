Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E67244EA0
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298248; cv=none; b=TCBwK3a9WuHPLtSy/mIH1g/9a/UaZ9HeHjFedypcibm66HThtw51+p5ywC/omf3RFsdwY9d20hNOq65vvcaFliM/9pgomyC5KGMHdytVMGM7Hxnr5l+tvWDTl7/+4qfwhTOAjqKAprkzaOp9FGhiLr7OH6RFKlSCjQRSrUK2n8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298248; c=relaxed/simple;
	bh=SeYBoLiLdsd4RYBx+xmk62y4glTyVdE4JpC5IMRPlMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5OMC6VHJL8QwQwDhlHOKjttOR5gXG6nIvWCHBg4vGFSbTgmePnAo7taKqiHHr+mwlxWmCi4rb6ITcKriKCechXqnzNwJT8bBBeJ/rsFRifmpzn4HD9JSNlPHTldQj8weMMPFp9b7zQ5lCybdknCecmjCOYLurN0k+3r/QOI0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m1jrc2ZC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1jrc2ZC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-af93381a1d2so434048466b.3
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298245; x=1754903045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbhdT3BVEtPsr7nMwgyR5zxNdwkZ/IAe0pEt6XO5SM8=;
        b=m1jrc2ZCg88sRudUTuHS/XVTLQOe6AwzV4cZgpwajlin0UQ7mEc2L0SkgpfNkGnkb5
         bDZrBr+/jyk8QspFEkn0Fwo8mszSj2BfV69spjWnmdGF9uOaJ5uXobP3HBPDyA3UGtmZ
         ZJW3ygVc2iPaubhcIrOKw1Kq+8RxZ9CVQ4oMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298245; x=1754903045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbhdT3BVEtPsr7nMwgyR5zxNdwkZ/IAe0pEt6XO5SM8=;
        b=gu/VGxSmn+WUL+urakzPo+e2ai1kyBobyIIU/gsA3C+aAACRO56LYiHC6QERNMPO6l
         K9L9cHwc6S4i5drX031O3WlhhdhD6uCXqhHObD/KMnM9bKWPQqOqaTFat93RAMkfrmcg
         6pMx1XTrnmyyF2DN+xEFQ/iqfIoW8M0LfNlubCjQZtHxxfVzOYxetIU0g0Nc7cYTrNoi
         IGazJjZoGcI46kh5mkahxnBGIXhO2pm4OLXf761VaCoeWK/nngjL/WAJ4zc6f+qorYy8
         +oT6gXJ1uwxGR3isOi+/+XLkwqpBb/0DonSuFrPbVbuLesQNWU+lQ/PhUvMm5iuc0n4T
         bI2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZOruVAxB1bDBmFY8pCmlDdvCMKgTg6cLEbSH8OhrK+ASzavirKDzNXBidEBu5JL3fo73JuPXQ+tLOLXgVZjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ/jIf89gwbiqMCDVD9c0fDrVTbMLfvOY8gwP9qPOSXh1SHwV7
	oqOjm07WAG1h34a+vmV3VFdBOqwaKp4PSEoUAYgcHM6taUGmKq706gpMuElFevYe/A==
X-Gm-Gg: ASbGncugRLNQoPxRpAcXXbSPAY7hm4KmQT94BV8CLpT2uyVPxEC4YExqni0HRud5LyN
	97C4MVUvlXJP7FKXqGQkJY9EQqASWPQE1znI+37+CzKoDOxUqoyzgAyP8z/9eRXBNVHm3nYxrEg
	IUzP4JkFutM1XWnMeOkBAl24/RyfOqkcyzEtitAabBkqNKGXfQO+GzRR3OG5/i0vKuyIx45x00d
	VrsZECG2KQOFrRM+oADtApfs9XF93jpWPRYrXlsZNBQ0dbfBJnla/xRWnjCUzdO9E/dS/+p/vrv
	YulUAY1bhW1POh+vSPYAbnxVka8abgC5DiwptsUpyfhzBAwT7Om+g3ZKqFkESpdlwiZF7Cpi+iR
	ee8YjgvWGwhZatMpXsuwJrXS5BAa+EkrPO0oIAiOgbvpX+dQdSbTKqC4fp/yeGq5bri+PiH0X8h
	vW7yHvH2VmcYOKy0QWXynkZRK4Uw==
X-Google-Smtp-Source: AGHT+IGevy8HvEbH/6/5kPktQXX98NEixPFRIRgQ3eseS1Hs85sSCgqCJM8sG0Zq21CouJBtYcjtwQ==
X-Received: by 2002:a17:907:6d1f:b0:af9:e9a:3ce9 with SMTP id a640c23a62f3a-af940031934mr1082193166b.10.1754298244562;
        Mon, 04 Aug 2025 02:04:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:03 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon,  4 Aug 2025 09:03:30 +0000
Message-ID: <20250804090340.3062182-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 14 +++++++++++---
 drivers/usb/typec/class.h |  2 ++
 include/linux/usb/typec.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..a72325ff099a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			struct typec_partner *partner =
+				to_typec_partner(adev->dev.parent);
+			struct typec_port *port =
+				to_typec_port(partner->dev.parent);
+
+			if (!port->alt_mode_override || !adev->ops ||
+				!adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->alt_mode_override = cap->alt_mode_override;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f05d9201c233 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				alt_mode_override;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..6e09e68788dd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			alt_mode_override;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.50.1.565.gc32cd1483b-goog

