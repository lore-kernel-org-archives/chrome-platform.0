Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33D25394C
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298288; cv=none; b=INUYDyAyCRFvgFMGvZtlz/QZlDAHyA4+G3AgMsXANDE2h0rEek8f5F9CoVxYi8U4oS7B5Y9ClZolC5IdOy6Hjl1fGCO+i/yUM6uW+0qTnTgTGGU43L4VO0ZRPGTTtb23kuok2R6INj+Fl4iY2USFuVEBxW8XyFUeHl/qr8MXxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298288; c=relaxed/simple;
	bh=VYWbWVA057Y0qPzEMkQr0mmrYKKhYX7GNZV3gzsbgLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2hpOY4KuNUW6sh5BA4DPOSJxeOKOvZ4/WzBzA+cxT4iNFq3ZOQh2ZItAzZfUgkut8gXDubMO2pPrBtiU/yT3N+p2BNU9A/8XshpWSQuP/B8asjN/U1rr0YPZ3xmHbQT9huW7/+2Cm9L87LStEWiDNa/GrPI5ETp+PiKLku2Bl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pv0uMwbt; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pv0uMwbt"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af8f5e38a9fso712543566b.0
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298284; x=1754903084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fCXGPTGTKW8fArN1je3Wq8jIm9fq53nnnBhW5Sy8xE=;
        b=Pv0uMwbtrFJP1ruKt/awfb/DgQP50vnWq2CV/tGB13crkxxTEblCmc8oZ3q2KaHwG0
         Xl2HmMLOixFz7vrKnGtg1Uu+96vL+sCA0rsI/Xdoo1WanPto80X2UWJqlu7X79PuT5Zs
         TFfJpqOAsWqDHmpHqe292yl0eK/6W3o4kJUoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298284; x=1754903084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fCXGPTGTKW8fArN1je3Wq8jIm9fq53nnnBhW5Sy8xE=;
        b=iguJucHFnW7U2Rz1prM8wQddu4C+AhBu9S/Eq2MK9giBpU7QPnn6RbyaKShJWrFfPv
         GuRc/Q4yM7AgfPRr9W5gUBhNMDGYijrZKYaiykWh71zQri43743v7jCsFN+Lu0u45OZ3
         7VumYtEEcyVl+oB6lMz+GBsoy8oaFHsNv0FwW3X6zBIHmLP/i75VnPUG1V6+QBrJpEpo
         MujxDM7pauBmpoOlSAt7oMQtYHqRE37SFztgKJ6QZSWNcQrVdKDbinIKpwsxay3xdlew
         /xl6o+lNSqTaJ2jD6al3ZPZ0PifrQplYoEwv4cAKeJKLWX2ZtcIsvkxdFDF6f3T/IKqH
         FzRw==
X-Forwarded-Encrypted: i=1; AJvYcCVfgLOrScnF8qS2MqE3FtBp2VfhKQStkswdmtYurxyUZ1aoIB8i88+ZjAZ1ZnSega1AjOHsB3JiVaOvOhJpsyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxraYJWs5VVXRIYFQpqIZZ3rC42qlO7Z1NA4A7vjEmvNk3sIvd7
	2wrzG5xOAaSrr6V7lqtgeNc6AEFU6NSpio2iRXtNf6q+6L08lCxoM3woTp4G5tqukg==
X-Gm-Gg: ASbGnctyfzO90NcvF2SuM3fc2PtgHg/xgilWfEHN48XQQZn2SR0XeJsPKSJkGScI50d
	m9KzE6jSV137p6yBeHDeaSQCsgTXq4gcs2nj+3WMESf/FMV0VVLhqneX9c6M9HbbwmAKQn8aL60
	3nWsLs3RECrlzdjrfjEePt0o+Q3MLxTBnjop0WZL5oSdcYacq1PaffBbSOzpauk9LASQOBYcDST
	5E5Wt9DaqU7Tm+lY0kMk+vIveMKOwK6jrPwHeaUL2Cx/AuirX/zyEg5z5aTq4AGcJC27hIw9gW8
	jqDSWJiX3DdPs11/SmEKY4rK5k1UkdPlIwL2wX3KgE9u43KC40sXacVa2ycXXnuwpzWzEqosmIk
	Bu3FLUhyeT0do7XJ+CoP2GeP5BIUI2C0J1G4IYuXcyt60hceqNrO3B7cz2jVCFZSTIhvwao7Gvc
	gTM9cI164U2MJcobU=
X-Google-Smtp-Source: AGHT+IEahG0mX+I5PDgV3Sb0a4d6qhy92gyT+o8P9htq7Mc1BKgfiFsyNZ/upIlcaxMDJ6sg67zRFw==
X-Received: by 2002:a17:907:9690:b0:ae0:66e8:9ddb with SMTP id a640c23a62f3a-af94000dc4bmr1075715866b.19.1754298284566;
        Mon, 04 Aug 2025 02:04:44 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:43 -0700 (PDT)
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
Subject: [PATCH v3 09/10] platform/chrome: cros_ec_typec: Report USB4 entry status via callback
Date: Mon,  4 Aug 2025 09:03:38 +0000
Message-ID: <20250804090340.3062182-10-akuchynski@chromium.org>
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

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 73aa25433a50..5a3d393c26ee 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -781,6 +781,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.1.565.gc32cd1483b-goog

