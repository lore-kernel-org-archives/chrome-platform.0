Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5616133C
	for <chrome-platform@lists.linux.dev>; Fri, 22 Nov 2024 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732247262; cv=none; b=sf02voBj5g7mrlzpTIKGmwngHaBXcikQWXhCuJzR6mhpYiUG99VaHKclhd5KPXU+shfcYBRYBnLaf/prEMULlc3amNy4Gk7ogkr+lRn6HgkIF7zoRbnQghfCY/mD91umeGHcItCHcQJcEM9UPR7zyaL7y9K/u78fwEYYkzNH01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732247262; c=relaxed/simple;
	bh=ecrPWNCROGbCGBvflsd6cHirBTqgXm1cERWiLr23QUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rt6AMrf/alCzgVE+FqcRlQd8f9Tri96OAIpuA2LYa6nKzus7zGdEB6mUdxaVa1R9QuzRlTgD/XDXWGvnSU/YJq5wFSdwH6/T0wYwTixp4aMZMucYh7Afu3yc3ZOsS2V5OY2XYDQwVXLZDn+XL/Yd4VaHbmcIvWm7Fo5kZ05nx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J+BGHwli; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J+BGHwli"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e5f835c024so1075394b6e.2
        for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 19:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732247259; x=1732852059; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knk5bhF5K5WlFtwhF1HiZTyghnwunglBtYROl19Amnc=;
        b=J+BGHwligmNpY17vRH9kUze0s4HULKSLKLxJ/RJ0BRunBVXKqKUHYdt1kV+CTPifgW
         fdC2pOVyxUeJ1fuzJZk8iJI25ZA52nRkqw4+zch7CjZiI0WfvO1Yg5k8ZWnI3mAE9Sk+
         T9N8T33/4UKkH0CcmF73V5Gyh64Gg16Pp5sVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732247259; x=1732852059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knk5bhF5K5WlFtwhF1HiZTyghnwunglBtYROl19Amnc=;
        b=M9frGn0EzhQ4Km+3xUFZGWN0mC43hM2wDA1dUNRYhgOw4DFQMF/Kv76jRowUeQ88hW
         z7p9rVgDuX7ydHUVZNbrPAwfo3BA4x1bVoMv9hftWnfYlkkIoVE9JXFkDl2a/75MmTC+
         ht3ZGWumDnK8IWYV23I3Wyr8nnXmV4km+GxgNnwMZ+Yi/p9vOc1IVGvC+SOPHHO/mWHD
         YYuhGHnYbSDHb7RiuzzUhEZl/2tgrbnscv9md3AghjpBHQB57/DGzVLhysH4xVgO29ej
         Ha4ark3Volf4E4Iypobw4bLUqK8Esr1WSj7OL+iEgJ4b/6Avg0AXw6CDFNPX6UowaSKA
         aUfw==
X-Gm-Message-State: AOJu0YxkowhTydwIr9SzVpxrjOIKR9NfsRvSOQ7xNWa16JwFEW0oPB71
	B4bmXk7sHUUrhN4+oOTdp7lU1KYWA/mfv4YsikgOaqikPwe4HCmGoIonAGYF5A==
X-Gm-Gg: ASbGnctFRShUml1ZrsP5Df5C2uxz/Q+0RpJganWZbIrOfxyiuX/wTGwk9sBvpKxKIdx
	zGEXmxYjVPw7cdjAUpFsQFdPYMRfUF2PIEHQwhWlt1t03IXIr0+H54gKDK0jgQS3RmrpH07QL/D
	FLQktcxTgClvnIb0HpkzOZLRarJJLaJWS+XzpMhUBGkB7Rfew6Takvow3psAvNWdVlCsnQjmciR
	mLZKiYxowENtgScQ51qXQavu0gaEk8kMMrSsW6UmySKOu2dVljHQw+7FZC9JTstszHU9lU=
X-Google-Smtp-Source: AGHT+IG9TmutnyL2idfCzGrxIgPrFSPj4hupzoYH5zYY4fJEibqFwqT2kUZnaPO1+nOzBHXjr0fcdQ==
X-Received: by 2002:a05:6808:3186:b0:3e6:10d1:ecb6 with SMTP id 5614622812f47-3e915afc2f0mr2042657b6e.28.1732247259232;
        Thu, 21 Nov 2024 19:47:39 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:533e:26bf:b63:973a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de554b11sm550174b3a.133.2024.11.21.19.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 19:47:38 -0800 (PST)
From: Sung-Chi Li <lschyi@chromium.org>
Date: Fri, 22 Nov 2024 11:47:22 +0800
Subject: [PATCH 2/2] dt-bindings: mfd: cros-ec: add properties for thermal
 cooling cells
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-extend_power_limit-v1-2-a3ecd87afa76@chromium.org>
References: <20241122-extend_power_limit-v1-0-a3ecd87afa76@chromium.org>
In-Reply-To: <20241122-extend_power_limit-v1-0-a3ecd87afa76@chromium.org>
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732247251; l=873;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=ecrPWNCROGbCGBvflsd6cHirBTqgXm1cERWiLr23QUw=;
 b=+Ar7fFL4Es6YoP98iJ8z+ts7PPhZxkPpxs/twgJcXy9F+hxWQE8UDw3qtSLkVEsv8smzvWQH5
 xC5M1yQiGp1B2ApDAeFU70wlo7L2T10cnh4QYIQ6sueAac/a24ZnXMn
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

The cros_ec supports limiting the input current to act as a passive
thermal cooling device. Add the property '#cooling-cells' bindings, such
that thermal framework can recognize cros_ec as a valid thermal cooling
device.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..2b6f098057af 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -96,6 +96,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  '#cooling-cells':
+    const: 2
+
   gpio-controller: true
 
   typec:

-- 
2.47.0.371.ga323438b13-goog

