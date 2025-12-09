Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848012750ED
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295235; cv=none; b=U+mYXt1Z8+z/U32ebmrjk0QJhARX1TyXbXiNlyLnz0gre6sd8xnWsF/D0VLueoAir82HIk3IwvYGeF5PPiIuQnJECUFQ2Dgk5HXUfanPgCAwEJP1a+6PJQnqBAECxxwfj+W4waeNObDgZ+CFIRXqH/nNM/s42IdehH8jJ1CPwVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295235; c=relaxed/simple;
	bh=m2A6ZHh38QLY0KCcRCAKW90Du25XkQzdMPrnADEF3KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSeT5HtGmpusIzx3pl6oi7KFCLqkDo2Bzut2n43WeTV/wLfnk+bEE5jdgYa5rU91nozu4PG8vEcwXZGC8ZbMdnSneTqUM0YtOK81/oL+9Y0dn/SpLsvndW6BeIxVsmRle4fL2UPRyn85LpmkP93vIw1hs9R0EV6DiXRUMvqp3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nI+32DDn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nI+32DDn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47789cd2083so35219605e9.2
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295232; x=1765900032; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2c04LwHbF/s3zM8ygqzdu4yzOQ4Hv2zMBfxhEf+2XtE=;
        b=nI+32DDnqlzPm5GoKgSW00sfdshE0BB+S4NE/u4aQ9u6FJ7FnnFJy6EV9DzGJyk9IH
         IbG2vEP2L7bGedrwdKdB0gm/RdX3Rsnqog256h65BE1CJG9aKdx+waMdBh9q4tgZa4t8
         rlxToVfYJTZMj0uEwphcIeF3KW3tFdNddhPe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295232; x=1765900032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c04LwHbF/s3zM8ygqzdu4yzOQ4Hv2zMBfxhEf+2XtE=;
        b=i/BY1J676ZbGnphzHXG0wQLQln5FSVOZl/z4uHZoiD34fOTaRt6sXfo6pGxzTEgXSu
         /YVWCREIGMXAqqzPFue5XKv7EqYtvfiztSMdlwSWUKU7wiFE17jbgAWiR/atEyDjZHA0
         1Plod4Co+EQiLnioCBMQvJPi3mT/nC0IfGN+nsbMvLq0sL7+Tx5Tch+wTbd7wj1WHmZ2
         /RzaiYrhHG9o8jTzkq01btfIZcUuvcbHYzdP8f7xkiE7G/5tGlZaPkRGJSjZ5tYQSlze
         5/jKXPHZBbJXSvFZUJhikLdk8xzYfjaoxqaU0UDn12xdPnQgTQ9QrOZN9aCQ5NwqjxY/
         h4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWOiGEidCfC8WfOda8FpvhWsl9hd4piE+iNicEsRrpzNSsDyaaNwx5weSXqzT50665kO5dZfLst1eTNqmEnNE8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAmB3CcFMJYe1moxJsxGIZpbf0/ToRGzzQ3Nw8ZpEYDvsT9Njg
	TjCt+lghZP8tXeGHZURmEYgtELFTr/QvQiXFufrnOX2qp/uIn8thKeuJwz8Cu8a5dw==
X-Gm-Gg: ASbGncuylEBLYZYmCSbKlOLoTKtbk5ZnGVBlkfB4t7ujYU/8QBVPHmtZ0IVhnAVFT4E
	46Xeaqhq6E5VbB2/PB7udU0UkM7QYED1aXHALhBaVxrdd//ObocqdGwHrNJycs14RcrPVSkgShM
	0J0pSXpeXMNwvPji5dBEuj1cZd4Me2LGb/x7IlqXX/0NDI8hxmGDeMM3A87IzdBqNtkRyaouvKB
	YbYhu/1TrCqCcfUG+EKR1SBnkw8NlIyxFfHigwPtCFQPXwMzh2/oNDM8ANubwpe0ni5wibQvBEQ
	kRvPbXVhq5zCyFWnBZ1d3Mh0CvhK2GI8q+4ilqNEtEw8osBc+w9CByHUrW8iA4R7bj84aGiilFA
	dWU4nC+6eMI0kBuG4o4DgypHvMAmbhdFG5ZM44zH4ckQ86iXEZsCPRdaQ9ODoFgJh25m87Uve5M
	htMALHk38inLcHUcg=
X-Google-Smtp-Source: AGHT+IETtig917c/959U67stUU8b8pUELNsuVOkLdt6GOzPmjWWtx8z0b7xMKjenAYwi61hJeTVS2g==
X-Received: by 2002:a05:600c:19cf:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47939e3a6c6mr124500145e9.24.1765295231876;
        Tue, 09 Dec 2025 07:47:11 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:11 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 0/3] Input: cros_ec_keyb: add function key support
Date: Tue,  9 Dec 2025 15:47:03 +0000
Message-ID: <20251209154706.529784-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this adds function key support to the cros_ec_keyb driver: the platform
can specify a key to be used as "function key", and that changes the
keycode emitted for other keys as long as the function key remains
pressed.

The Fn key omits its own code if pressed and released with no other
function key pressed in the meantime. Non mapped keys do not emit any
codes, this seems to be the behavior of other devices I have lying
around.

Fabio Baltieri (3):
  Input: cros_ec_keyb: clarify key event error message
  Input: cros_ec_keyb: add function key support
  dt-bindings: google,cros-ec-keyb: add fn-key and f-keymap props

 .../bindings/input/google,cros-ec-keyb.yaml   |  60 +++++-
 drivers/input/keyboard/cros_ec_keyb.c         | 193 ++++++++++++++++--
 2 files changed, 227 insertions(+), 26 deletions(-)

-- 
2.52.0.223.gf5cc29aaa4-goog

