Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5F218304
	for <chrome-platform@lists.linux.dev>; Thu,  7 Nov 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007909; cv=none; b=b5DGW4GyzmMP46Bgp2+vynf6Dtn1XZfD5i2/a72eASGqEh3z+gQNG5Tyaz5HAL7xragtJ+zJxc1v0AJm9pp1iAeb88EXx0scF6js4HZpQXO1ARLTYkFNm5Ljz5C7sSwN5WTuVrQ4vuUgMWCo5WVf5l4SovcgDY4JYPpoAZWMobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007909; c=relaxed/simple;
	bh=F1pTFIC/STStCNqTkG+Kgg/bMEZb3NhFwcrsacG2V4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ew5E6IKKt4rZAdmPKZp2/bkOl0YS/54ebtywI8DuUzxMQaR+HEoF/jFodXUHtX0sGsggXg/Bns3P3KyOZsiFooUCdWK+HkSdsD3p62h5qeMWeHt+jEEwGq2qy9GZWWHqvyrH71BSLFIxS+LIJCgIhU9LIN8cESHSx46virpfjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ymz+yPpV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ymz+yPpV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7206304f93aso1209359b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Nov 2024 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007907; x=1731612707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHcj0dVpOorLNzt+K3XMiAGRMpCigjM3RXLcIpCRHg4=;
        b=Ymz+yPpVrq5GAgkxklccyD51bw44ApAc2drXDCd6rQI3dvLe5ctQig7cSbwqPkZwR1
         sncgnzcyuQPixzzg7Lm9jcx1woQr9ChksshPl7O2bMH5kN4If/GwoYcohqU3K1zxwFeP
         qMgpGatOot1POfhPaH8o9VvW9IYyw2tfmliE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007907; x=1731612707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHcj0dVpOorLNzt+K3XMiAGRMpCigjM3RXLcIpCRHg4=;
        b=gB8QxF4oMAxyBlIFkpDvgb3s/2HfkluKxNjVrtyWfd5GZiLAWu/SQRXy/RAqMz21ni
         ibkVjdEN2hzL9gpv5Hb3cO/AdTiMZYP4fxGplYhH8myNTqJtngGpHq6bfepMNEk2qCaf
         TpjOej88mGTPzZzbDiRvDx9yqnYPbFCLr8or8PjX2KKs349UPQPbkEHagKikBLb6d9ff
         vZIQ9iJyfIsfopCP9GlFugez9ARSsVYm6MBZ0Iv5XKvAdnvsPnNtkouufRu+kL96lpAM
         dsn+lO7KWtZEz9yvnU3s6FV+taBZQVXtcur+sGyoEkeeb4FEXzK9Krs53m/QG4yfN0r8
         1SYw==
X-Forwarded-Encrypted: i=1; AJvYcCU+apJjobe3lXAN8VJON9MIIm5wC9ZnXEz2VJnJhyqNhvqeTRoF0Ekhs2UGXNb3C28sykC28THYmnfPx2mMctw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDivoh5rvoMi+KZHpQUugigxJKJCwDBXb+Pyk0KByXSWDLvq9
	ApB3hRXbSC9MRt5Rw8YFYLnjeu0bqAtT+BTLkOOR4JLGO9n/KNS7ASvdtVAkCdt+ju166ulmTg0
	=
X-Google-Smtp-Source: AGHT+IHDevD6Gmfrr4MwmAepRm3599OBUDO0F/CJ4qgD4bU7JNZCnBYFjzrvU6Mh5L/usSA2LFDrWA==
X-Received: by 2002:a05:6a00:1252:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-724132a3730mr313854b3a.7.1731007906775;
        Thu, 07 Nov 2024 11:31:46 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72407a18e2csm2009358b3a.156.2024.11.07.11.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:46 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Thu,  7 Nov 2024 11:29:57 -0800
Message-ID: <20241107112955.v3.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
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
2.47.0.277.g8800431eea-goog

