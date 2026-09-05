Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB23876BB
	for <chrome-platform@lists.linux.dev>; Sat,  5 Sep 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604081; cv=none; b=tBlMTeOK4tv6ke8loicpEZdSFwDXnmEVoiF0q7XEWge7Sc2jsi2qKH/pFFRbefY1Xfi1AHk+4WQhAClYu+W+eID9zgN3TB2nDBJuC54Q+m0zOiX/EcFv5J4B7zp3c9D3pCziQZ6CEO8cFcvFbiz62fUYAnds2P1fb4HlIForF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604081; c=relaxed/simple;
	bh=dlbNoACdY1hY0MUhs23rCfrulJIHZ8hgPRq2IfWUGvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TtuOt9lnFAjxFkY/QSM5ATWSbo/ssN6NZxyJOs5HfElZ1u3EHC5spUBP3ePest92b6nCRJ5BZMMbtvz4ZoJXeVV1/1iXdDXQvo7YuEFRCw3jPAT7dLDL7w430OsOP1drX8ZjfoeqPw6ORwoQ1MEEvzPBDLbXQbfRRlK3UWPHyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv6CbIHc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv6CbIHc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so22629925e9.1
        for <chrome-platform@lists.linux.dev>; Sat, 05 Sep 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604078; x=1789208878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyTY0nwwZzUa7fZ3gDJHMuw/Fs6srMMbATIv6rdlJDc=;
        b=Xv6CbIHcm+qI9wo7pRLEkC9hnUAjR67EMWx6PMNqpU6wc9Zgkkmf5PWhLcZhhCaier
         5j0Oa+ObVWrqEASenZiCL9h9RAro+g+8mlLOoMotd5cIi3WIYgeKAOMADaTVFU/agGZ9
         whqZ5iNLbAXtioD+BCFjHJoxUx3ZGh8cphN2OBjoE3T3D+eoIEIwARhqDdX3/4GWZ8Q8
         HvPWijWFeopXlT0FbSa3sv+M8iDTaZBkZGZjn4OPJTnVl7HLjSxrg/JMIMvsYmkONT/B
         aAKk6q5+dMTeHUiGLoo7OCngYojSGLAfKpiSv/D+1TBrAIwJV73M8RMHZrqnWhc6CXg2
         XLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604078; x=1789208878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyTY0nwwZzUa7fZ3gDJHMuw/Fs6srMMbATIv6rdlJDc=;
        b=kRYgjtb7uTqZTjxxscnjhBDDY997tPFF64lOdGOqo4TbqXryYVxI/K9aETkuLaYh8F
         l8dimmq2pjI9gELJgBDaCvGd82dQ1gH9ASfjkDVL73XR/8sJaEUJRoX6xAanYiF4TBt2
         mKbZIz8sMjHHJQx27YOy2fFzZ9/zvltJmJpk+kMCMXHFP15uurlxaMURKXwqfVITYOqI
         rtGhSPcqH6Nkj/A+FygueE+Ru0oZ+fPpaIG7Cp4qug9PiPy1DflFd0lzWzkv96fOvcw0
         SdTTfQLEOCBjukh3PX3CviQC6mHrmcJG3AbX4HFotOUyDwMTOlZ7D/fg3zCbFf/+m2Gu
         SKhw==
X-Forwarded-Encrypted: i=1; AKwUvBw6SjiZLM082ohyOC5NUFyKaTsgF+oqgqAH9+cI+KhweYz7Od2P4Ur4IuNA4k2xQN/AEjfp6uy7xGKwd8dQnUs=@lists.linux.dev
X-Gm-Message-State: AFuF++mRbo/UwEwspWnMWRWWl6Uw6Peso88kMUI7kA5jmDmw0Hr+Sp6s
	on+f0181JYemnubJHMm5RgtFCmPxIYrQgi+wNJVXaSgpmEekSkRSxegu
X-Gm-Gg: AYBFou2j8O8da+aUdE29RqbKbvhmaSxEIRCh7gM4PQVTmjDbsOzIhPFRG/4NpoAERzE
	F+ZmK0nMq2sQotO9lUoSY4o7Abkv9HaOAfPZWzGA9rfGF92S7YcpHzBtDoEiJXf+xZZX1riRf78
	vLsPZ6rXVsUt8aqh62CCouiI3Um5Z7J2D7/9uX952LAhjxmOxI/UA+gdPt9oFWhfzpyKrL+UqFr
	1nrvyhgVfHu6oLIP5/vwys9CIP6XBRIAQxGjWkTa0cAEVBOM2/6ZnPP7Li4AQh2MjnCjDG+teci
	27aF7eXfz9qAxMDx0h0HtxM8tTP/EwlBZ2UmvaDf0EJTEt0KWsBLLri8PCNFUQemaOi+xNr5Q2T
	+xP5p8ueyefRiCvQwghElJnTnO+8Fuz81BaolCfJfLdhBYRervJ5uuNTknFGYSwUrNqs2bbrkSQ
	m7PevVrGGEtGDYIBfbG/4YCgtYcT1n4UP4rSr74fKO55GwXrUiSVvyP/Wz7oUERu1vUAexI0oEb
	t+MhsWD+aXiNaZk2QEj2oZ23HVjlz2SL8fJoScWYHlaDlXkJn0eMkAd/Xm9J37YpG747Nsb+dPa
	DL7Rb8S34CfPH9bRONEWIxqB8xWYRF7AEBQibT2ClhCBkeZYO7YZc76fDB8NAGxT6gg=
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr179495365e9.13.1788604077721;
        Sat, 05 Sep 2026 03:27:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm57698195e9.2.2026.09.05.03.27.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:27:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] docs: ioctl-number: Point the 0xEC row at cros_ec_chardev.h
Date: Sat,  5 Sep 2026 12:27:54 +0200
Message-Id: <20260905102754.43160-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 0xEC entry points at drivers/platform/chrome/cros_ec_dev.h, which
commit 5e0115581bbc ("cros_ec: Move cros_ec_dev module to drivers/mfd")
moved; the ioctl numbers now live in
include/linux/platform_data/cros_ec_chardev.h.

Point the row at that file.

Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..32c0d08e92e4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -399,7 +399,7 @@ Code  Seq#    Include File                                             Comments
 0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
                                                                        <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
-0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
+0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
-- 
2.53.0

