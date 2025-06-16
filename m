Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10272EAD0E
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080808; cv=none; b=KypWcY8k3TapPREkOQFTGf/tdJ7Peg5/Otccrf9yBYmgGHnDYxTyhvsZehGOGu+pThZ98eMHi74VF4q3kmZfk3/WvNeb43n3slMT3t/VHYJNxbDrdw4mCsiKz0RaYXmf+mHm9iIWG0Sj/qas6INP6Lg1d1c9+Do+1jOXzDWLIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080808; c=relaxed/simple;
	bh=cMKsJUotDdosJ5GgRT61ngKqLnwH/Sc2vQwUb/JvwaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgSMVOrXLbdEkfsiQND/f348gHi2DWU5WQ3gHhXueFxLynnyABajBVaRVZ+HjDhIEzWbp6rFrhg0QsDqPw2/kTyg1tzZjc4EjukEceTUiyNaSO4YKXhGF8FE5wgzwvM3tOgRgCQm46ieU61zZ+45A+YF+oTBRlyUZYEBXjHrju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MNLCricU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MNLCricU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso8325255a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080805; x=1750685605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=MNLCricUMIAz19/Rl9ruUKcmKuhgbCkUrGCtRKvnlilm1nDTTTWOeWlM6sDbKDz7qw
         et17psVbjHSx3P5JFVxvbufdmeMNlB0KFwbmBOFcYRFrmmsTHcZQABlRh1AK9dtElLz2
         5fE4FucjaNPAjEuYh0TOpw6rlS6EExzpXmH9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080805; x=1750685605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=Taib1FcFdoNW/m3BDWNRQVwEJ+6QfbUx7ihlBBx4xQlBsoUuUXSF4i3fCCHHHknNkO
         KOPankxspISrsdgspfNcmoCD1P0SJg9B7uV45zaXm2kSm5NThQvjmCJLePLfxUSBxW75
         djW8wZJ8nADQSPhxGh5/x3MRRAX2c4pkAr/ExKLt6S/6f9eEnM9Ce0xbOIU2etB+lTBq
         K5rXjWoJ1d3eyf4sPHAyV28htjHHdTSDIl+L2KOmXQeMB4+FJGbynx9fO5K+kgPuIWBX
         dwcjIokUwchAL1uv7VZ+34HmQPSTTOpCsP8NW7Nc/7/ojVeb1Voagvq2DqAey5Iiku6J
         Vapg==
X-Forwarded-Encrypted: i=1; AJvYcCXxrndjNuQl+5HNQcmBPXW1Qu39iucNFpfFqPRFK8HhsnB+y7h6Ns35n1LHUSb++1uy8wXqq1Q0mp4ms7pxNYA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8//vyp5u7XtSRZuJUX89IwD2yHR+R9KRpElmbixHr5w/P5mlT
	tpS5TZN3GABSJShF3W3LTATJ1Dw7NRye8tSgSuGgt3iikBQ/tg1dIW0JaEuPH5Kkew==
X-Gm-Gg: ASbGncvWgyXcUGu8k2kMOtIdp5+n0V0i9pXMj23X0eqNKW+7APIrUclUcGQ4bPJfif2
	Ysuv1tEa1HEe1zuhX16ZupFyvijbiY2jgAVcJrxPn/MZUu4anDNSRGsDMn2PQyhKT+uFJjgEvXB
	FIedM/AK16Ei9Psq+zxq2rmoBG4p9feZr9AtJ5Y/oaeKItQLWYGUcOUP9fLNhmgX2nYlnBY7RyM
	+sY5nZnzDwCT7+UWjsOuvrThiZVOaqLho8hD3JohwWDwA8QR5DpdqVGT7JVtzjH2L/A/CHDxvjQ
	kBlxjSP1O349TlCGiIxRKe5jbVq63QOh3JsrTe3TZ00ha5sCEG8Ga255U7xQbOVTo6uRpe0mJDg
	4j2ObEFerdI4aqK6HlyYdV1Jui8iYiiNNWkMJTd0lGUCfagVtiXL+TN8+ow==
X-Google-Smtp-Source: AGHT+IHw6+ZqjUiGtijKP7659AHwRHhXUfja1QVHvIcjre79jMfTDQp7kopiYwQiEAC5sFmbVRn9HQ==
X-Received: by 2002:a05:6402:268d:b0:607:2e6b:47b2 with SMTP id 4fb4d7f45d1cf-608d0979e84mr9154566a12.26.1750080805113;
        Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:24 -0700 (PDT)
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
Subject: [PATCH 10/10] platform/chrome: cros_ec_typec: Report USB4 mode entry status via callback
Date: Mon, 16 Jun 2025 13:31:47 +0000
Message-ID: <20250616133147.1835939-11-akuchynski@chromium.org>
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

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4f338771094..c5a7f42ffb5a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,6 +698,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.0.rc1.591.g9c95f17f64-goog

