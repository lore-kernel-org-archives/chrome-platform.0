Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAC33016E7
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988414; cv=none; b=SWGf8RhbA30AKB1D4rHPE8ikKNryBVpArjOGfxJzsea3gmx3zxuxvrEtEpYclKzhFRk3x23ih1oOHR3fbgpXnmBQXeo7Y2pXIemQGj/QViji2/ZgxtoBPi5RfLCgffuNIiZgwYyzhzwPX+fYTGKUOKN59DU0WmzvbCTCGXQyRpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988414; c=relaxed/simple;
	bh=WiqBNXOl3cRjaCJAYVsy21ddsz+svXl8bRrhWSOeHSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkIkF4eM5/0Z/MepqftNw/aa4+HXlVzaKGywy0W9JSUv3+pweQ09BlvBIept8XpYtCFBDPCjl+OBpJokRlzAjapDpDy3mwyXclgLn/zL3SEVHUH+8E/q0jXwAVjxjuxDjh9R9C3Rzu1M0qD8hqviqP4x4JUnfHLTvSf1ByrUm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=alUE9HSw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="alUE9HSw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso7521271a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988411; x=1764593211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20W+VePrDZCUNpW6oks/2DqF0UJGlQouxoOcp4kUQPw=;
        b=alUE9HSwQKSrRocXb32hmj3+2GMCyUR0uz+vdWnFiFyvC+B7wIl/RAPTjuTUytllZs
         I0dErwRGsSxenc7msL+f2S11TIIG59YL1KrEmUhP3xA4wpjOer2MdV7OCh1t9cF7sZS/
         XKOVWUS7H8fhIFMSOpNdPaz1znBD0tazEz1N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988411; x=1764593211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20W+VePrDZCUNpW6oks/2DqF0UJGlQouxoOcp4kUQPw=;
        b=qcUXdnUqEAv5G4IiH2icVXhEVrnKRNWelmuSDZHawZhU2tsXd5TG40dPOSf9StENh0
         ykv5B0ochu/+/wVlXYGZfXIy9z4R/1vz2Y736oeFOYxijcj9cQglOlgXvOBT5SILcEOH
         TxKcrj7nG7Wz1E4h4bzs3AZ0XewuproCyObhvSZLhZ0eXhEU+w0drwfOoyJDphP483Rr
         BwCYvupleOyaFP+19K2J/QHIf8JKg6QRFi5EfuRUuRM2l2XNf99N4d38cfH+cQcK0Eip
         m8Uonnwfy2Fec4DSiKteJLth6a4fTX6PA6Rg8NcMtYBz6rjT6KGsJQvLHcuEYyaAhoJU
         hnMg==
X-Forwarded-Encrypted: i=1; AJvYcCXEkx+326OZCTcej7w4meN4wje6gqARuUGjrluHyB/kZIJ4EdtN33h2gDxCOWMUnIyE52n/2NPbJry5khMz0Us=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx03Ugi+xjSpXeBatnCCSdSyIRKElUJYMafFCEqN0mfmwI+VIcb
	NLGl9xQ3mUtfIKb0/cV2Q/qKhTDalfKzTmO7J6HXlcE/hAdTHZMQZPQGhiww4q2Dtw==
X-Gm-Gg: ASbGncvEFGzqZSQ4AmuXJ0Q74qVzJJ33dOpy2WidF7oHd9iFXVVcGbf+xAU+0RqwiTh
	yWAvUZdGp31a236n74RwXHb6szclkL60PQ/hwjfqttLoaehDB+2OXFY7bPG9J8H3WjRZm46Qj1B
	7OUHv/DUNct5q2HAh2M7gwxotKngi3mhOBZjio2/5gCaxTIAVyVZ6YjCn0/7lXsIC0LGTCAbd2L
	DnR7mm2Z3xw5OejK2FwhUWxdtPzfvUFxMVnPpe3lyx4AI67ns5Y9l1+qTMOHEr08bQm75uF6ZAW
	3M2TRCLz9sUWWibl9qx+S1V/W9CykR/O/psGcJY17E7Ryzr2yLtC3HF8TdhVvgJYl2xh7mprvfi
	MrD3/hCUjUIwmzgV2YhkX4vMrQeHzN9kmapDdwrfzgxfmqqgUZjiLtCdFSR1EzlXLOaxecH05lG
	e38I/DGELkTx5d4SE+5uuIL7qcuIxjbupGkDgbaBm0mKzlAvHdXZvADKH2IrLXhf3FTRkZijbd5
	fT+G7AtMAQ=
X-Google-Smtp-Source: AGHT+IFBc5f43ZGu6GEElbBrb99VGVIcJ0+CIqsv4BCyTkBuMMbiuLeutPFKmbIx7Sw8GvAwIvAE3A==
X-Received: by 2002:a05:6402:3246:20b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-6455469d112mr8681807a12.34.1763988410986;
        Mon, 24 Nov 2025 04:46:50 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:50 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 3/4] usb: typec: ucsi: Set no_mode_control flag
Date: Mon, 24 Nov 2025 12:46:38 +0000
Message-ID: <20251124124639.1101335-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a..82c3efd72639 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1700,6 +1700,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->version >= UCSI_VERSION_2_0)
 		con->typec_cap.orientation_aware = true;
-- 
2.52.0.rc2.455.g230fcf2819-goog

