Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02F1EBA1E
	for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132962; cv=none; b=ZuEtgoXu7jYoaUO1EEzqNNgIWTMHTc83gXlD4eo3EWT5TPX5jN6bmCu51VCupaRC+OSLqNyH6PW6aZ/uSaGG+bcpKrXncNilPlz+QiIZG9I+noLa7xm0Ou8EAZ79ThQf8ta0pCyCzg849o6GP3tbvFTrerest03QqqdOP8X0UXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132962; c=relaxed/simple;
	bh=xa7ZITbx/fKw+VP+IHzx4VpDezXjxvTI2S/mn22zsww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSCtgrkSxZGXwFtC1Tuz81SU1pgxwh6WPHUTaOZ8/467yVMAQwWLfTy/xYl45A3mNn/K1U0b3Y51Jo9D9XupwC/kWXPliM6DXOeVDu0wH4pRBSuEkw+W5SEJij9fcNDTlmjJq3DxrRr2on3BpdcprAnA+Msmw0RCYKQ39ehJfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nhB6u1jH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nhB6u1jH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21644aca3a0so27011925ad.3
        for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132959; x=1734737759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoXGk9cHKtSOQa4a6C6LkFtb9JQOG5rkseWbgU5QyPQ=;
        b=nhB6u1jHf0T907g4umh90E3BpBObBVYAAH0PCqQIKZovsgjgBIzIAMO0OvLnHya1em
         XM8alzPLvKqEuiXz2A4oUhkpwpfA3dsBt5apHJMeYmu0DhxyaNXGbsFthhuSNj/AWcXW
         fGtlC1V0p084JYztDzi0T/wmI6AroMzSMi7zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132959; x=1734737759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoXGk9cHKtSOQa4a6C6LkFtb9JQOG5rkseWbgU5QyPQ=;
        b=Q6ZR+vnPDTq1nuhUd7Wg6ojb3YRVbzowfYKoTEt/ztpik+qtnzwL4zwPsPaT2K2HPC
         YAQ0ASuEAif43gOgSamROw3jduOpdyKGkQvnM42MY0vFzn8TtXA7uY0p5KXloRRcX5xS
         E8zPvfYeuOh8eCeq6H1qYIu3pnhCz73N3NRlWlrc7WHaC+nkPpZ/v5BmlRCYGpDTZjxk
         XMjMg1auA22vch8KwqhyZJV9uHoV+LH08sucN2rIPzUwWpaVnmQI5PmBiLssAHJweJ/8
         s2djnWydCYghYdJcAmQPvX2PGr536RlxCumtxsPCmPp5J9G9pR6gXh9qvzhg0sKKWbhC
         tUHg==
X-Forwarded-Encrypted: i=1; AJvYcCVRO+/yrsVgT8vktPViqc1TidAgNUKa7R6wnghUJ3gbHagwA9k+8kxDHHDDrjH2lpDe0KpCC15vXbFBelKDrbo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLKPLqnLEZY0CQVMSec1Eid9yECkVU8adXzsBLid2Cx1cer2eJ
	QFhcNNbIVtF1oSQc77PF29ZhghQCLeNlma1savGdAV1OxCvG63BZLnehSOWU+w==
X-Gm-Gg: ASbGncua6TiQFOokneJrVFBUSpSze8VH/UKg2vDQdacasrSwJHi3A/8yOPLfGgPxG8v
	k7Z9Rqqm1H0dvalYPMHRnZwC7lD8Je0pRMQ2Dl0ZlLyc2MDUS9117+to1diKNCGFtWEI7vDivxK
	2en0ipxWK+EQkuaKOXHfeREjrzSW6MjPjnfVM5QSF+pPNXHw8ipc6BADwnU2gE8ijwl1U96eswJ
	1VzOezZI3+oDCUQWgMDnol1NNRQVZhvj9htJDp7J95rGNbtKt4MyQJ/DxltTjE9Vlawguw4WaDu
	wNQOfy7TK+9xdc5zfr/lHhgvkdwen4A=
X-Google-Smtp-Source: AGHT+IGj8OoR6PcX7JFvEhC3cr+1TepLuESzGZ1SSO6zsYDlRXtgjRP76IUOq4gmFU1odsuAMpqg/A==
X-Received: by 2002:a17:902:e84f:b0:216:1543:196c with SMTP id d9443c01a7336-218929d708bmr57844975ad.27.1734132959517;
        Fri, 13 Dec 2024 15:35:59 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e5437asm2896585ad.162.2024.12.13.15.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:59 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Fri, 13 Dec 2024 15:35:46 -0800
Message-ID: <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
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

Changes in v5:
- Use list_for_each_entry and simplify conditional statement within

 drivers/platform/chrome/cros_ec_typec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index ae2f86296954..77f748fc8542 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -619,6 +619,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -677,6 +678,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry(node, &port->partner_mode_list, list) {
+		typec_altmode_update_active(
+			node->amode,
+			port->state.alt &&
+				node->amode->svid == port->state.alt->svid);
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.1.613.gc27f4b7a9f-goog

