Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76F1991DA
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695355; cv=none; b=N9xgvA9Ckq+lYOq2itFyEDq6cS5iZbtiIPUPlGr+apFcUNWQP+d3lCLMjKSTEa8RF6pQmqYyLjqPc5qwSmoCyg4gfA0CiRHW53rNAn8AYZ2FK6/Blz3c2AI8YN/9ayz0yoQ1mNteizuLvD4yGPvQA1uTeUYbughzj2his2bPmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695355; c=relaxed/simple;
	bh=JNXCflDio0Du4CwfDelhowY/4X5glDuOivTHSZ4vr60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N59Ox8RqoEREGeaOPZbULCJ1OoAr8//ZZnBe/HyrHrnNK3JD9JktdRM2K7a3p+t/17k26SjcJvJTACrUxHPNjmeFegPq8+l/MK3aGRYsUnvRRNK7QogHXweOQ0kLBVgd8XU2xfDUsi4C6VNwb5nSzyDRZbgl/IJGipGS8OtRZ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gr8+mfR4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gr8+mfR4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7025ca8bebcso1087460b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717695353; x=1718300153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNZT90i7xX7z9SBNw7Fi+15fEhA21+XfQ1kCVGtVUWU=;
        b=Gr8+mfR4SzmOApUrc7EFYmUM/+AECZdRNBxrVgO5Ry/ZQXMXevMKxL8agyPLPcIawk
         PxQTPZhWW4UMYSwzu63FRWKymsS7bsHdOmX9/86yI9GLDHo0JBsu1Tc3vnvJo6nBNbrr
         +LwOLyf5HoOID8ft0fGhsEx8BShXPHMG7U0wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695353; x=1718300153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNZT90i7xX7z9SBNw7Fi+15fEhA21+XfQ1kCVGtVUWU=;
        b=bvhg86VUusT42PucOl0PcaQLvVKEJdVjDqcs2nFft3eNWTicKTnlsrZYyrqRPRrrio
         ZTBb2bhB3maQkAGfyOSNlB4BA/8J87zERZtoJVT0kp/M2d85r5zHb6HHFg/fV0qsqQfQ
         s4+5O7h3MfnkO1WNZhrjCfoEFP/eByOE6WOL9yfC6qkyL8ZwkxdrZ4OMbs7J2pxqnaYy
         UM43buazAYXxoaY5lB5sPiE5reAUo5/4EQISQs3Xb50MrXZIrTqLuCww0tY2fXcM+wZw
         wK3sBXtMepIVoq0MLJMoYUDraj+dF8pgUmiyGrJrPqALGw/F8dz7b0QChzUkv0nO4soH
         /3PA==
X-Forwarded-Encrypted: i=1; AJvYcCW4pAykaoCilKnNRspt6r2o+PJ/3v6y3Xx3+gBmkI0ROUtmfzm0vXMMfW+4VprW3mCHNoN0mp9BTHrs99alDHEP5Pxsosr8hyY4+uJiX2RF
X-Gm-Message-State: AOJu0YxMP1bc9/IYxp+/LHJps3WroxJpcvEUZS8PEXFzlocwaLFRY3ju
	V42vppDwrVO3q+UjINADijuP5nU6ahpE5mhz7LPjVvjcqoP+0eBMb9B6iCENXw==
X-Google-Smtp-Source: AGHT+IHvUtVDhjTFNuhMNUZCXM9tIRlP4ACCXa2ST0RxyLrWRDwQVLc2GshKOnDDj1UIRLsNM512eQ==
X-Received: by 2002:a05:6a00:21c9:b0:6f3:e6e0:d9f3 with SMTP id d2e1a72fcca58-7040c752719mr134972b3a.31.1717695353412;
        Thu, 06 Jun 2024 10:35:53 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:3fe9:f321:712c:442f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd375503sm1334904b3a.42.2024.06.06.10.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:35:53 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3 v4] dt-bindings: cros-ec-keyboard: Add keyboard matrix v3.0
Date: Thu,  6 Jun 2024 10:34:30 -0700
Message-ID: <20240606173509.243739-4-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240606173509.243739-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
 <20240606173509.243739-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for keyboard matrix version 3.0, which reduces keyboard
ghosting.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 include/dt-bindings/input/cros-ec-keyboard.h | 104 +++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/include/dt-bindings/input/cros-ec-keyboard.h b/include/dt-bindings/input/cros-ec-keyboard.h
index f0ae03634a96..afc12f6aa642 100644
--- a/include/dt-bindings/input/cros-ec-keyboard.h
+++ b/include/dt-bindings/input/cros-ec-keyboard.h
@@ -100,4 +100,108 @@
 	MATRIX_KEY(0x07, 0x0b, KEY_UP)		\
 	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)
 
+/* No numpad */
+#define CROS_TOP_ROW_KEYMAP_V30 \
+	MATRIX_KEY(0x00, 0x01, KEY_F11)		/* T11 */	\
+	MATRIX_KEY(0x00, 0x02, KEY_F1)		/* T1 */	\
+	MATRIX_KEY(0x00, 0x04, KEY_F10)		/* T10 */	\
+	MATRIX_KEY(0x00, 0x0b, KEY_F14)		/* T14 */	\
+	MATRIX_KEY(0x00, 0x0c, KEY_F15)		/* T15 */	\
+	MATRIX_KEY(0x01, 0x02, KEY_F4)		/* T4 */	\
+	MATRIX_KEY(0x01, 0x04, KEY_F7)		/* T7 */	\
+	MATRIX_KEY(0x01, 0x05, KEY_F12)		/* T12 */	\
+	MATRIX_KEY(0x01, 0x09, KEY_F9)		/* T9 */	\
+	MATRIX_KEY(0x02, 0x02, KEY_F3)		/* T3 */	\
+	MATRIX_KEY(0x02, 0x04, KEY_F6)		/* T6 */	\
+	MATRIX_KEY(0x02, 0x0b, KEY_F8)		/* T8 */	\
+	MATRIX_KEY(0x03, 0x02, KEY_F2)		/* T2 */	\
+	MATRIX_KEY(0x03, 0x05, KEY_F13)		/* T13 */	\
+	MATRIX_KEY(0x04, 0x04, KEY_F5)		/* T5 */
+
+#define CROS_MAIN_KEYMAP_V30			/* Keycode */	\
+	MATRIX_KEY(0x00, 0x03, KEY_B)		/* 50 */	\
+	MATRIX_KEY(0x00, 0x05, KEY_N)		/* 51 */	\
+	MATRIX_KEY(0x00, 0x06, KEY_RO)		/* 56 (JIS) */	\
+	MATRIX_KEY(0x00, 0x08, KEY_EQUAL)	/* 13 */	\
+	MATRIX_KEY(0x00, 0x09, KEY_HOME)	/* 80 (Numpad) */	\
+	MATRIX_KEY(0x00, 0x0a, KEY_RIGHTALT)	/* 62 */	\
+	MATRIX_KEY(0x00, 0x10, KEY_FN)		/* 127 */	\
+								\
+	MATRIX_KEY(0x01, 0x01, KEY_ESC)		/* 110 */	\
+	MATRIX_KEY(0x01, 0x03, KEY_G)		/* 35 */	\
+	MATRIX_KEY(0x01, 0x06, KEY_H)		/* 36 */	\
+	MATRIX_KEY(0x01, 0x08, KEY_APOSTROPHE)	/* 41 */	\
+	MATRIX_KEY(0x01, 0x0b, KEY_BACKSPACE)	/* 15 */	\
+	MATRIX_KEY(0x01, 0x0c, KEY_HENKAN)	/* 65 (JIS) */	\
+	MATRIX_KEY(0x01, 0x0e, KEY_LEFTCTRL)	/* 58 */	\
+								\
+	MATRIX_KEY(0x02, 0x01, KEY_TAB)		/* 16 */	\
+	MATRIX_KEY(0x02, 0x03, KEY_T)		/* 21 */	\
+	MATRIX_KEY(0x02, 0x05, KEY_RIGHTBRACE)	/* 28 */	\
+	MATRIX_KEY(0x02, 0x06, KEY_Y)		/* 22 */	\
+	MATRIX_KEY(0x02, 0x08, KEY_LEFTBRACE)	/* 27 */	\
+	MATRIX_KEY(0x02, 0x09, KEY_DELETE)	/* 76 (Numpad) */	\
+	MATRIX_KEY(0x02, 0x0c, KEY_PAGEUP)	/* 85 (Numpad) */	\
+	MATRIX_KEY(0x02, 0x011, KEY_YEN)	/* 14 (JIS) */	\
+								\
+	MATRIX_KEY(0x03, 0x00, KEY_LEFTMETA)	/* Launcher */	\
+	MATRIX_KEY(0x03, 0x01, KEY_GRAVE)	/* 1 */	\
+	MATRIX_KEY(0x03, 0x03, KEY_5)		/* 6 */	\
+	MATRIX_KEY(0x03, 0x04, KEY_S)		/* 32 */	\
+	MATRIX_KEY(0x03, 0x06, KEY_MINUS)	/* 12 */	\
+	MATRIX_KEY(0x03, 0x08, KEY_6)		/* 7 */		\
+	MATRIX_KEY(0x03, 0x09, KEY_SLEEP)	/* Lock */	\
+	MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)	/* 29 */	\
+	MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)	/* 63 (JIS) */	\
+	MATRIX_KEY(0x03, 0x0e, KEY_RIGHTCTRL)	/* 64 */	\
+								\
+	MATRIX_KEY(0x04, 0x01, KEY_A)		/* 31 */	\
+	MATRIX_KEY(0x04, 0x02, KEY_D)		/* 33 */	\
+	MATRIX_KEY(0x04, 0x03, KEY_F)		/* 34 */	\
+	MATRIX_KEY(0x04, 0x05, KEY_K)		/* 38 */	\
+	MATRIX_KEY(0x04, 0x06, KEY_J)		/* 37 */	\
+	MATRIX_KEY(0x04, 0x08, KEY_SEMICOLON)	/* 40 */	\
+	MATRIX_KEY(0x04, 0x09, KEY_L)		/* 39 */	\
+	MATRIX_KEY(0x04, 0x0b, KEY_ENTER)	/* 43 */	\
+	MATRIX_KEY(0x04, 0x0c, KEY_END)		/* 81 (Numpad) */	\
+								\
+	MATRIX_KEY(0x05, 0x01, KEY_1)		/* 2 */	\
+	MATRIX_KEY(0x05, 0x02, KEY_COMMA)	/* 53 */	\
+	MATRIX_KEY(0x05, 0x03, KEY_DOT)		/* 54 */	\
+	MATRIX_KEY(0x05, 0x04, KEY_SLASH)	/* 55 */	\
+	MATRIX_KEY(0x05, 0x05, KEY_C)		/* 48 */	\
+	MATRIX_KEY(0x05, 0x06, KEY_SPACE)	/* 61 */	\
+	MATRIX_KEY(0x05, 0x07, KEY_LEFTSHIFT)	/* 44 */	\
+	MATRIX_KEY(0x05, 0x08, KEY_X)		/* 47 */	\
+	MATRIX_KEY(0x05, 0x09, KEY_V)		/* 49 */	\
+	MATRIX_KEY(0x05, 0x0b, KEY_M)		/* 52 */	\
+	MATRIX_KEY(0x05, 0x0c, KEY_PAGEDOWN)	/* 86 (Numpad) */	\
+								\
+	MATRIX_KEY(0x06, 0x01, KEY_Z)		/* 46 */	\
+	MATRIX_KEY(0x06, 0x02, KEY_3)		/* 4 */		\
+	MATRIX_KEY(0x06, 0x03, KEY_4)		/* 5 */		\
+	MATRIX_KEY(0x06, 0x04, KEY_2)		/* 3 */		\
+	MATRIX_KEY(0x06, 0x05, KEY_8)		/* 9 */		\
+	MATRIX_KEY(0x06, 0x06, KEY_0)		/* 11 */	\
+	MATRIX_KEY(0x06, 0x08, KEY_7)		/* 8 */		\
+	MATRIX_KEY(0x06, 0x09, KEY_9)		/* 10 */	\
+	MATRIX_KEY(0x06, 0x0b, KEY_DOWN)	/* 84 */	\
+	MATRIX_KEY(0x06, 0x0c, KEY_RIGHT)	/* 89 */	\
+	MATRIX_KEY(0x06, 0x0d, KEY_LEFTALT)	/* 60 */	\
+	MATRIX_KEY(0x06, 0x0f, KEY_ASSISTANT)	/* 128 */	\
+	MATRIX_KEY(0x06, 0x11, KEY_BACKSLASH)	/* 42 (JIS, ISO) */	\
+								\
+	MATRIX_KEY(0x07, 0x01, KEY_U)		/* 23 */	\
+	MATRIX_KEY(0x07, 0x02, KEY_I)		/* 24 */	\
+	MATRIX_KEY(0x07, 0x03, KEY_O)		/* 25 */	\
+	MATRIX_KEY(0x07, 0x04, KEY_P)		/* 26 */	\
+	MATRIX_KEY(0x07, 0x05, KEY_Q)		/* 17 */	\
+	MATRIX_KEY(0x07, 0x06, KEY_W)		/* 18 */	\
+	MATRIX_KEY(0x07, 0x07, KEY_RIGHTSHIFT)	/* 57 */	\
+	MATRIX_KEY(0x07, 0x08, KEY_E)		/* 19 */	\
+	MATRIX_KEY(0x07, 0x09, KEY_R)		/* 20 */	\
+	MATRIX_KEY(0x07, 0x0b, KEY_UP)		/* 83 */	\
+	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)	/* 79 */	\
+	MATRIX_KEY(0x07, 0x11, KEY_102ND)	/* 45 (ISO) */
+
 #endif /* _CROS_EC_KEYBOARD_H */
-- 
2.45.2.505.gda0bf45e8d-goog

