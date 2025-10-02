Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA13A55
	for <chrome-platform@lists.linux.dev>; Thu,  2 Oct 2025 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759433454; cv=none; b=XB8h+IGxwnRRGa6KM8vl9psTry/CGM740BvrNt1nDt7tSE1RVyNV/jtT126JPubwGo7EtlNxtGfasU6Ob3Ayy3gZjpvaw292Tl2BS1LHPP99Fo6cVhwePQaTuFy6ZX+x6VQR+WfOSHNuFKTw0tDldhI4M16U0iekHhCAd7mDeMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759433454; c=relaxed/simple;
	bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpLNsqqivKgSNj4SbmkjxS8Za/eJ2w+zpGSWNbaQJSFKoKcTbDdJcIW2pvVUELyAiP6xWPn+3LenhL5JekuL4Wagn5niEKZns+c3lSJXnIyJywOcNeMiLJEiRfbzdrg6h4UZVyPWnM70vSK+AMj90m2Nmh6P9GMo2RZB4b3edzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uqCv8Te5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uqCv8Te5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so979292f8f.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Oct 2025 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759433451; x=1760038251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
        b=uqCv8Te5Vo9PfNrgBJFC4aMacZ8LS950wB9xXCLMRA3/6qeC7OWuDScL8fLx7EELTI
         9E/L2O3IHY3CHL5YqKPYTbS9/XIngb5WeR+sAww1Jw9p4sDgOAJ94T5IF340vJoPOC+S
         oKJ6iL61433Wjjn0NVz3sxqIWe8U6i+QAueBa9kdzH5bnB9mhInvDJ6FpJJiSTsoe9EM
         /nVGOxJo1DN+tXWuR0c4HIiz2XSTPrULm05Q1LBHcTcsnxFIvrSoAyilQT2k8CLEZs19
         LcTVk7UvK1QKjD4egfJVOqHVwHAln2x0uLQo5780Vw/MU/c0exBPfu9BuIWLA4lPaw6X
         3WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759433451; x=1760038251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
        b=AdC50nmvGJzqBK95wRf+lefygLz4f8m5926VSDzwOoWGAVunPujNE1q7XehoHfLtea
         O3UOaDmXVA5FF7s5uPMFaLEvso0GhjArF+AgAu2SWS0rGAUvYPKFOAoSe5+qfbh0df7W
         JUU21luFvkgW3tz+79gQmL2Mg+wj7gvnB4vdf3BSrfdhVJUt03awoURxMJ0+n+GNgPPO
         C8mvnpeA4XKtZK4xhp2PxCwasZOq+gWEk9/NZdTUnvgo/3GOdM0o/z6UDBfqQFM37eFF
         zqb9tyUnRQVOz9z7s20TF8d8QOVwuWWAJmMdr8HE7zk5PfYcLcnU/N5Su6Zy8H4k98Em
         dqcA==
X-Forwarded-Encrypted: i=1; AJvYcCWdg1iM87QXDnYnQWiKnOjFijc+sJRFLz6UHV2G+UMYYRl6hczvRgxAgLIztbXb+Wx6F7ffwmbHZka89Gnj5QI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTQrHdlMt4Se4P8MHHNrPpCR8WNBkTj6YWJTwjuGt9OwrqE2jO
	I8xUFz/VdsLuINscfQ7OQl4ZLkrrGsCRR/tRlDETDKKYceLU5YSy0CsYU3GM3kIqLR9o8VxeZm7
	BZN82Wj5D84L/I+oZQrELhOcVsxa3T2ASSwciSYDM
X-Gm-Gg: ASbGnctwk/aw7hyyGaJdKE4z6DHx0PXIfs2dUtDoZT3ksPzHuj90oXBdfeUkufBpiqP
	4oy9m8a0glI0eZfEXINagyTy5Cj4NgUZYZ3Xt1ioo+BJ6Z9tU1CJ8eF4y4ut/bvi2BnT8f7FEnv
	bD7Cero5hhmyl6v5O4HKEd9Zj0rXC+OaaqJOtU/HCd/fEW4F7jnQuXkBIFXMR2ietSX73T+EplJ
	i8aGcCQ9yVKY5uYu22NwIzAwy3qOMmyAIm/DrsFqlxlA8d0sXt54sRbCVUleww6TKS5J/paCYIP
	LqA=
X-Google-Smtp-Source: AGHT+IFCU6uBe4gWMYCNHz3kAgXiO/K7bY0HyJGwPrChQwZ9JM6yW0mxGVSnRHqeL/KB4jYDo6HP8b5r3lGA+u45RuI=
X-Received: by 2002:a05:6000:4024:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-42567135148mr286275f8f.17.1759433450604; Thu, 02 Oct 2025
 12:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926-topic-tbt_header_bit_fix-v1-1-122238af5c82@oss.qualcomm.com>
 <aN5fpicXs-JwKvQo@tzungbi-laptop>
In-Reply-To: <aN5fpicXs-JwKvQo@tzungbi-laptop>
From: Jameson Thies <jthies@google.com>
Date: Thu, 2 Oct 2025 12:30:39 -0700
X-Gm-Features: AS18NWCP5sKgHNdu12Azk2AdvFWe9eB4GL8mTduwvhesRx7j7Vpkw8n9TtAOPbs
Message-ID: <CAMFSARdM6CmUwfntnbG3THsOFC33KyZnR1RVLXmYwFJum+5K=A@mail.gmail.com>
Subject: Re: [PATCH RFC] usb: typec: thunderbolt: Fix Thunderbolt adapter type
 bitfield values
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,
thanks for raising this. Yes, it looks like this works around the
current faulty definitions in typec_tbt.h. Where
pd_ctrl->control_flags is assigned in our EC firmware, the
USB_PD_CTRL_TBT_LEGACY_ADAPTER correctly gets set to 1 for TBT2 legacy
adapters. So the data.device_mode assignment you are updating here is
currently correct even though the macro is incorrect. Your patch LGTM.
