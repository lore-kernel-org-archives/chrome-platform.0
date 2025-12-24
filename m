Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A134CFBC
	for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589768; cv=none; b=G9MDLIES5RXyf2ZcPtkeNV0dgC5DXn3vqMW9iq8RZHM6ooAVq8lDqhoHXx3wLYGYac6AUjC0U3W4+ySHNW3c3yHZ5GkNx2dRlDheRIgIG3bzMBHMcxd3OYb+tTye9EEgH+H16PJp/S03c9RJCZhvSbF/z398CRAQ0QNC+sFdBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589768; c=relaxed/simple;
	bh=zALY9dlsMwzl/dAwtyaG4mXGxZf+fv84QQNolu1ZQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/GLcGPSEU+7XBZ/Xl/st+RhbSaksXModBUlkZlUXHoxbcxuvSIGhkGICWSYOy0CPZHcro2/+ZHxg7NbclQIisPjTxgJGnuJTjKlubfRxxQ4LGyJl0l1elI0K7OygLWphjBVrAa2fU+XXC+S/WbtRNGVjF5etkWmNLkqyM2rDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GhwVGw5h; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GhwVGw5h"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3086408f8f.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Dec 2025 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766589761; x=1767194561; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PADMdGxAb/N51/r8LkdN24AdvAbRzLZVqXNmvAQV5oU=;
        b=GhwVGw5hcYca4Bw6/wUvpNd9fFiWox42oFVgo1dDql/UJnhc9Cw6dAmj3rBOCO0DwM
         0AJdRxMd5IHIut44dg0Mx8XMo1wzUAmDm9YMFfzyHs7/kt5xqOGTNbD3yFF/hPUDMHZn
         eCDFiQMEuOh9NhjwiZHUkAR0UF2vmCZBukdZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589761; x=1767194561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PADMdGxAb/N51/r8LkdN24AdvAbRzLZVqXNmvAQV5oU=;
        b=mJxdZBG9mLG6ULS6XnBLjQaY2WnC0tUYeZ8cJn+YOYzd1hcZhIIUMjxkbHsyBj9q7U
         9Z7JRBCaCRtU7zTBFDDsvQprTICuTunUIGbmCnJhcAh/GQbRQ6bXvKbJ/gbwAS1FpLe7
         /vNgglGeMAQPSPlisbenzLSGmuJN91LrHk/rah5Lt1BDHOHj0y5Plfif8dv2OleiIK/U
         2UYC1qcdwcD1wwBECZaMYkHPfcLoLxo8KFVwkDlHFqpFapdtO+/nVwBPTcaD7MdtNZBT
         zEcGr4Y3mz0ipPey29qKYXAodfg0xa0JcMZLVbUVktHKdMk/CFXxIZdIVV+J7bGOQYxX
         zM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3SY3OPAzbJYzN53Ams9MY8JBTWS3gasaI0UzNopNwYyXY9/15aiTou4NRIzxWYk+1cBV5xdeTxS+ZfmEqnpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSmoPrT7lizdDcC6791gB4t692+U85RZmrWRjPA415q3trCuoL
	F27U7bx61hvShpQZb5xOyCad3A0lyrjSXxOyb8AStJXU8hQNiFXaMpfSPUuj1hdxug==
X-Gm-Gg: AY/fxX5MssI9EcFUdk4E7kb+D3GrRnnz5EIpJ9Nk9q0QQlVPsuxwvrU+XhDAvOtP6sr
	v6K0KUc3j/h6kjgi9KF2qDkrCSEC+P2wzGykUK6EPNCqgzhZ6Qj+mFFVeireHGvjQeRqKvK98dl
	7VoKqFVXkWoCblzIwb7j8TE2PWROaGM7Pd/sdIAfgwW6+zUXMATzK8KqSBWGzMZ7L14TGykrhXf
	BQjKSkYcpDRFlthBMvIBkBsm+8IGHdHP0QaVjWOO4Tbfr8qOF2DLgtAVxg3mPdAVIrWmJZ2CGb+
	jWJk3P/vYYMV25HVjR+jQiykRwnt8wrtwRZ+J/K6k8hGXNvj9lsySWsCoj3hkT3qOFGeBOd0+Ym
	feBr9ACjPHVOsaiDSLz4ODc3IBObkPIvDMOR+NtpSveDvbd79IPZcVHmeP6ShQ7S6jWnVek2HuT
	rEUqZPn9PxUab0p0T//o7t5Ce3Sg==
X-Google-Smtp-Source: AGHT+IFYkk1rgHyu9nVNfjejw5HKRK1BJ+Hu+T0J0cFClraYCSLWRZJM/CdbzE8a+VtE+OxWg9t4JQ==
X-Received: by 2002:a05:6000:1a89:b0:431:2ff:12ab with SMTP id ffacd0b85a97d-4324e704914mr19472833f8f.61.1766589761125;
        Wed, 24 Dec 2025 07:22:41 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm34307363f8f.0.2025.12.24.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:22:40 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Input: cros_ec_keyb: add function key support
Date: Wed, 24 Dec 2025 15:22:36 +0000
Message-ID: <20251224152238.485415-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v2 of the cros-ec-keyb fn key support, reworked the whole
configuration to use an overlay map doubling the row key size as
suggested and handled other comments.

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one

Fabio Baltieri (2):
  Input: cros_ec_keyb - add function key support
  dt-bindings: google,cros-ec-keyb: add use-fn-overlay prop

 .../bindings/input/google,cros-ec-keyb.yaml   |  25 ++++
 drivers/input/keyboard/cros_ec_keyb.c         | 120 +++++++++++++++---
 2 files changed, 129 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog

