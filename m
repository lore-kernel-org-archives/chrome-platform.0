Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AF21481D
	for <chrome-platform@lists.linux.dev>; Fri,  6 Dec 2024 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528333; cv=none; b=JGYVKz68Mp2VNBiXsOz9hcEHg9oi/filWuVysVDItf2VN7fHlT+TjnzZ/YY6kWZVsZdaF20g+lHUFqnJTj4Ty89dKeV2fL0K7PyjYTxuiGx1BbrEVopXTYM11L3fWSuhuCsAlbMRn0NJbpeJcbCXc4Mrxs/95kWUX65g1sjojws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528333; c=relaxed/simple;
	bh=mSbImJ4dzWme04JaRICj6xcOiMD+Em1Pq6oCKRsC+SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsQ3cc59niPbZ204r5jrSI1rqnkeI5bRCn1OYk5JffRAWOz1bBB+4E0T/acqfLiOqEjpzTXPk78rP64ZBjXRwt8X4gLAMLq6iXoyDiH6EgiFTvDNv+gB8esKBC0CPKng0trG/MLeme/ot2I0NVEYpQ9jRze82dUQx0maBmCuahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l11OP09+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l11OP09+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-215b0582aaeso20645315ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Dec 2024 15:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528330; x=1734133130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcArLAGlc9DQDoWi6KCdvmZsVO2iZiC3gTAsa+lsHVQ=;
        b=l11OP09+Cd/loLl6nzl0M0t9rfFKfl/taaO2H+AxHes0CXBGg0l7oJRofRfiOS6sEu
         y/kWyb/lIaeeXrWcrb1GyL7q/rD7yN1P5e7UgtMVa9OxrxdyvTR/oYf6dxoh8acG6RD9
         Nxp1ASCKEXM45jYRcEzLzNew2uRLIst79g4N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528330; x=1734133130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcArLAGlc9DQDoWi6KCdvmZsVO2iZiC3gTAsa+lsHVQ=;
        b=TWSmmwpI2sipp+wJ7Vxk/hix5UPeafXj6yBTVV0/lDkC8IEituHU+DSbONgyF9zP/x
         jOszIu6XqKGkMWHiuO816LmQVGzlF20FX17vOgSHOfg6D7MPbYr066XFuHxZ81LXA0xK
         ZP4yTAYtyqyYJA7DLI5t3Edm31Pp0TdFFOs/nXHgtafZb7z8wsFtkdKCVaLRVm7Me3W1
         gc0TnmNyI0rJXUO1jUf2NiWV5ofGSUCENy55jRF3YGRnanBiO11g5qA9mGQrjxfG8q1g
         o86UVhsbjnrKNyeHbEfauA2BPdGVAH2GmF7Rzkc2HYRHpjGLBTY7ECyf3Tgpw/TFk4NN
         lpAg==
X-Forwarded-Encrypted: i=1; AJvYcCVxcRX060mgNQ1B//eqhcfX8xcYyOjrXKPr5MIxSTi68+B3YyEUVp1lKFObgrWZcOyUoQHYUGIMloUbFWhrdio=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvooFxfQsS3eQbEcfrzUb+oqB/wSLOTc8zEq2rsGiFL+I3Mzzl
	/SaAQUXKbVlTQR+wpDseYzei0zkDI9fbURkwfYolghcT5EW9K40sNCDKwD63HA==
X-Gm-Gg: ASbGncvWwDiihaBMoRiTUcrFvonUs/kyhDdt8hY4IQDW5vXFYh3sBhggUDgvwPtv4ur
	JMq33xbQRk4rCnxtV0fpdbFbmtavFw27P18o5S+ftc4Tu6WoJ26aIUAL0a5VgoDfp3GGmsFoaXN
	o5bVfT4jR0hQSi890QkJz4hqsGS0JT/GXHxw3hfoBR6QjWpALLLH/u5c1G4va5/baNRzN1dXlgI
	Zt/d1z2VL9Uts5tiWlv7l0JABm8u4jBxeoFvsLXvoycd5S3mO/lJD1Ng9z3tCRowFMj6FIS53qV
	//gcoAifcYaphdWFnpbG+aK8
X-Google-Smtp-Source: AGHT+IFfLFsxeaCP6JpA4wv/h1BK8Dgjnc9khGWbX2GJzIK3a3OtB6TO5+qcZX4naTvJeWS7CY8AWQ==
X-Received: by 2002:a17:902:d2cc:b0:215:94c0:f6ea with SMTP id d9443c01a7336-21614ddb7b8mr57867325ad.56.1733528330015;
        Fri, 06 Dec 2024 15:38:50 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8e3e452sm33980235ad.43.2024.12.06.15.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:49 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Fri,  6 Dec 2024 15:38:15 -0800
Message-ID: <20241206153813.v4.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mux configuration is often the final piece of mode entry and can be used
to determine whether a partner altmode is active. When mux configuration
is done, use the active port altmode's SVID to set the partner active
field for all partner alt modes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c7781aea0b88..e3eabe5e42ac 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -618,6 +618,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node, *n;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
+		if (port->state.alt != NULL &&
+		    node->amode->svid == port->state.alt->svid) {
+			typec_altmode_update_active(node->amode, true);
+		} else {
+			typec_altmode_update_active(node->amode, false);
+		}
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.0.338.g60cca15819-goog

