Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58CA3469F8
	for <chrome-platform@lists.linux.dev>; Mon, 12 Jan 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210397; cv=none; b=n28BpQvHob7y65Vp47aMOf67nepJikKVAb8iqn0UGvdrG9Xi0k2Nky5eaqijcP2yXJociqP3dp55PRN4GgAtVbLB0l3ii5ROUxy16DxwZhGt9Epd3L60Ji6gFkHhb8DBUDBZvRLnSJP8G9OBX+HYvfhs/yZsG8CCDuS1PVAKtyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210397; c=relaxed/simple;
	bh=IAKl4vpIBEFH7+YWJ3gRbOu7pA7TosM0+vs3odp96+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dtlvylp7REIrf35eIMMM8uCxe7nDLMaqvJYQG6jgOWqh6aLJKB4PmJUEK5e9ZHVhVqppA4ZDMF7XzavJMK+bm1p4I0hauDPiGbhoA/msBasXUJX90G3ffJqOonLp12pyFsIofivzHkg5XV4Hqg0G4hX5r7Kt96C4kgDlf397eNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XFWQaRBI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XFWQaRBI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d2670932so2517126f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 12 Jan 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768210393; x=1768815193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DP5z3e0ZOiisg8hZsQ1FZqU1iTR24BbzmoSmozFADbc=;
        b=XFWQaRBIToYl1u0f5Eay0vsslxAlMCZ/1FGN2G2tDp+SVayF0gIAMhBKNcq2FnwZSa
         GUSi4gf6zkURB8OLEYPHtboysmNSZNXX7VK/fc/limnI9NCWxpjJTTJI0MJAnYj6uLm2
         nfWfcv9tcW6Lw1e7m76o7NJizNLAIzMRu/T1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210393; x=1768815193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP5z3e0ZOiisg8hZsQ1FZqU1iTR24BbzmoSmozFADbc=;
        b=aEjHa/e9hte0JVLMpHmSG84FrALXHEvAv5zsbsBZnELIvJvByDILuOg020haYRcz/S
         11GuE0gW2x6mgx/pEZlqsHFx3U+zlRNQ1RQLUzFt6xJPw6qdlCJAcw90Qt/fRx5Wm6zA
         A3ebdXqV6223m57yJXqqCK3PEiuOqowixUyo3zT0FpYu58Gg3VHoJuLbCO9hjMiNbgpQ
         YsYAays81fVxHl9XjsB+dgqbwBAAcKSSRGrX2JQKNsjrACg40Fpo9p6NkgkikVfohzdd
         ORKXIi3z8pa+A+P8rGJGmhLyWh/OsNJCizIrvnih1iOY9CIm/n1qKruvUARRQkk0l3Is
         8vOg==
X-Forwarded-Encrypted: i=1; AJvYcCUNjK+aLCshZHfdDHPObhGvKBB3fEdL37QrwWYguJLdi5Fwb2l/yhblUs35f1ifYJT0si0hzZTaR+mtEVYPhuw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB609skpLPGnxa1MpO1EUFPUV88NVyymrXqtNDir1a7MSeBtO2
	D6rq10puqUJXpSHbQaLYSEYOAzjt5IxXsykjP5oZa2fhDjRtObz4OgDb8SPj0rzuJw==
X-Gm-Gg: AY/fxX4aUSv0pa1FqiFjUdHxh5/QZD9FDXCxX9U8yM0VGt9lD0eo/qUFVcLWwFn+FfD
	MDCqix9pLFHN/iVlIww60m7F/1n5sVb3DY6XvzEGhr7QJiWm+c6N3R0C6PmqRPKJo+RZdbvC3k9
	3H2Z1AE6ayYebarvNPB0EAmQRKcXw5F39n3wpP7f3QSyRVBfjq+33gTcudzt6HkHn3ZgtRixG60
	0O94SCybtLqM4lMPxZqMeXEa8EJJlbw3Oj6tHGSxQosARu6sIarw3ceFd7oNFa/EgKs8EJaCy1I
	KSMKGS9CVnWmwLajpK5UAibdlsEW0iltOe21Ywl8lV68LbqZIe66voQjx9gW+PGRXxeJwXJiQjM
	XerJqSpswA97Lp8KZua4oyCbpyTiKKio3QZehBEK0VBQUvdB8SngjxpGDyhTCvscs19+A6Q8YBo
	XXJndidFyQeCuWbyvhNlibeJJv7Q==
X-Google-Smtp-Source: AGHT+IFswOEiIqy/9YWajbGN1gT75zToUj2gfiKRmyBNuc6vk7aVyRzAS/0ByYHRt5DYQaP6QCA7xQ==
X-Received: by 2002:a05:6000:24c2:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-432c37c8796mr20710449f8f.29.1768210393125;
        Mon, 12 Jan 2026 01:33:13 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm38608881f8f.12.2026.01.12.01.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:33:12 -0800 (PST)
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
Subject: [PATCH v5 0/1] Input: cros_ec_keyb: add function key support
Date: Mon, 12 Jan 2026 09:33:08 +0000
Message-ID: <20260112093309.240905-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v4:
  - just a comment tweak

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
2.52.0.457.g6b5491de43-goog

