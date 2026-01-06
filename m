Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD24400
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767698999; cv=none; b=gGP9TlqY/zqY4+bKFqjz66Rl5hdk1L8qNyfw6K1G6GHKnJUARTQKV0aJBHAJmISYZ5e+zKQouwWLMGy1mosJoqnOSgHBj+HeeDyeJyWfuJgXLrb+CbpT44cUPIGVl0oYr5O8e3UUfCw5OHL2Ynw3/umn7iLvEY+Zv0eB2Hw1g4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767698999; c=relaxed/simple;
	bh=0wrkhC+xD7/mOrBL5I7lsFF7eZ11fQ2+WNqMAWhtW1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ny9QC1dEV4DFE92ZKQXzFW14HBnqqUMKmNVxM7+LgyKMDQGDvwH6cTTzNrg+mOzOErgZapd5iOwQxwW/6eKdZ1EDqKZ9Y+mVfjgjLEeDepO4wTA3cxtwuppkygDC7mrqmdNr/Zw03geNsnoBQvRjiVpLz2aTVaFedIqT22o+ToE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BoE59J9Y; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BoE59J9Y"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so450532f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767698996; x=1768303796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbInK7KTXrm5vdne7L3ipVyi5YmT0872ER+KijF8Q8=;
        b=BoE59J9Ynb/FXabNkgVWQFVMJ9fDyGYgKcy0kraHeUFuv+VWa/WC5EWHGBYNIGp46a
         goiFgiriSKb02GfjqjvBrFi8X5XVJt9fnS1MNiA0C5Uh1LOpu16cujQOwB4Gn7OQ5FfD
         IKuGU/PIH/3FSuuc4wT+vqFTeCLQlS7CUrUws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767698996; x=1768303796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCbInK7KTXrm5vdne7L3ipVyi5YmT0872ER+KijF8Q8=;
        b=tl4xqIBwpatY3xHfpw3tMPS/x/wiWNvkuW79kOVUe8yTKGwmrumypF18Cdu3/tthFm
         bCF0blXOx5QHpIXGaCXBzRjvswke/+zX9pl8BGgz4SAicELJA9JglmojunPeM+1Eegwc
         1YA5OVlMvw8ha9X3U4JyxbT3GkGUBxqBQxIgrEQvMlNvI0KA22kSnMDZ7Er+5qYUZNng
         mSKaPvAYn8Cz9ffHEELxzVL/finDYGuC3MsuQwVFemZ90Uq4NAlIdk+1eQPrQx43beVJ
         N5zwcDj92C7L8tctzcw495zYACeSfYrGi26eGpVsPAbhW68jL5R7Oj70GK4gaUrSsK2a
         Lgpw==
X-Forwarded-Encrypted: i=1; AJvYcCVg7raYc6wpnyin5ut38NFzhbu1zX1OFYH0iLMbjb1/Vz7WJrzIAifso/sBO6MAyL5nzdMvw/pHMkwQgDnX9/w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeUUUFYDa2pxkx4YWMOynCAR8JKVXRsanweMODqCZuEpvQp1gv
	jfyeh6h1Dh8+/rS6p8JC1c6LNEESiY0NkoKjbfacz0jWNw052gDeJHiANynO+AbgkA==
X-Gm-Gg: AY/fxX5R6kuh+oBHCKvlSFcm44/RtBecXPugIM6MfxsIEh8Xm1Vo81/wuUk9qt5JNxF
	A6t8+5rk1nG+BtEWw6faeFMiHQwFVgi1dv9csonxogvMja/LxownP/b+zB9VW4ECjMI6pfGOWiX
	fWze/5MGdmSbxdnT0t3PF5PRcfVR7hT7JUORXIvtrt4UX8geCE3Ep9GYMfET15vIFZpBzLoRUck
	BA+24e4rSuHfShnAmigTYfRUcY04e+tsQVyr8g9eYuAZVmUstLOfCjOcle43jXzQkT4zmCjmD/7
	zR3oqKphaTlnSz64K/Zjf4DjavvN3aRc4EMfXOd5e1kE2Z1Qq3iAaFo7oW6eVU3lhvHtKOLQVlv
	oUqrEwMlT7/8hme7CwBlo/VChL87v29Os0CLqR3cTRnmgZr7UqpxSYBh/jY6dO5Otnurlu/Z/bx
	zTGd9JGlil3AT2ZinbzG6JCqzfAA==
X-Google-Smtp-Source: AGHT+IGfT/FLcYXvnITELsfpKQwLNSv0AztBCwz7BXKs052Z23SiSlEo4WIlvNjFk/SeXeZ9VYOr/Q==
X-Received: by 2002:a05:6000:2387:b0:42b:5592:ebe6 with SMTP id ffacd0b85a97d-432bc97f368mr3199898f8f.0.1767698995863;
        Tue, 06 Jan 2026 03:29:55 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm3757482f8f.31.2026.01.06.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:29:55 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] Input: cros_ec_keyb: add function key support
Date: Tue,  6 Jan 2026 11:29:52 +0000
Message-ID: <20260106112953.692304-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v4 of the cros-ec-keyb fn key support, reworked the logic to detect
the fn layer automatically, removed the dedicated dt property.

Changes from v3:
  - implemented fn layer runtime detection
  - tweaked cros_ec_keyb_fn_code to return back the correct position
    code

Changes from v2:
  - renamed the dt property to use-fn-map, dropped the example
  - added few function comments
  - added a helper for obtaining the fn code
  - reordered, dt patch first

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one


Fabio Baltieri (1):
  Input: cros_ec_keyb - add function key support

 drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog

