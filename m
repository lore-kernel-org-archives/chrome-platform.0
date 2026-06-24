Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AEA385D99
	for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284462; cv=pass; b=fLxLJECa7XJfWOtYoFsIC2IdnM2YTj8OuxDW6NP7n7Zmf7fexBH8yEBaVo+PMuoEtUd0MB8gbA1A6SPDvMAVoQisZ3W2S+VbJCET8UOBlfOXbw0Fi/ZqW+pcJDvUDFJHZ/p9nQ/YnAIHLlFT8QZhi3rwKf1pGiO3XQhWjW855MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284462; c=relaxed/simple;
	bh=k0PVmMklvBZfRcSW3uNZOo4G5uRq1/vDDLZWWCDr2Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOT4qQtTLL7gMFXDgUaOfxSuvLtUbnZ0+AsaNbjPj/tCNKrENE+7CuLr+a8JmhDhFABYaUsgm7BUG+D3zwawOdVANkOb51qjjXbmhHq9GENF4DHNo/YmonJjExU2uvY9FmIVwgaKdieMBKTZe5f+hF7VRLjbeCJMO6cwLDJQzk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtO4xAzM; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtO4xAzM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-462342ac290so816768f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 00:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284460; cv=none;
        d=google.com; s=arc-20240605;
        b=UU8PxwvUbyyK8pFp9WL1S+pZhB8M2iSpzRklKFsXaW9liGWBc3s5O8xtzvVWv3tq+u
         RrZ0xY4q1QR0qrd/0JCXyCs8jWh/WD4U0jjYHmvwitDYMqftPlgmrInM3F03g7lhpbkq
         80VS1YnhPuOVoTuSUM/C1UkuKttK4k1c/bL9IHdWLgAjntYVLDHgCc0hJSpYD68JZOMs
         ZiyzlCOv4V6Fujtqz+ja5LTgFmVaFRIb56HG5fwQW/47EysAWiO5GR6wxLnpnxamuwKj
         rsrXGhOQCfNn13U1zJtjxsb0RgpSeBVueRC7jZekVgmneWHHQj2OXl8qEQpiVXReSdS0
         c6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FCI1XmtKR5ODmebVbKG33KeFJVLEzf3UXC5d3eUG/2U=;
        fh=LsAqrK6M8JwFG8QyFYnF/vEfaVY1ASE0Cbn+f/rPrBc=;
        b=NwuhCVFGG3O94r9MeDj6DCOVVLuM6hwkwHx6I/pQpS+4WGHuokSaCo1I8H80iA9Kns
         S6kFO4B6Zryc+T59bWQkfp/oUSZJGtGQGALuJynH8cgxIL8IDGwwBxaKbcfovNS2IL5l
         hAzy8nvy2Kwv73RP9l7nQf+Vu08M25947TgLCrdGILc7wZDBSdvXW8Km5PQRtm9M+k/D
         uZN3iUzFe+sW6BkodoXRcS7PtuRrEPJ+SJlXqbKaKhPlJopIe0QMPPdDAbPdw9m9YJlO
         zlLSwx8+fkhLMik6vCNKi/jqe4j/AbDCg2o0XJ6XBU/xhijfdTnlWZ8A5LkMSIRVBTXq
         ElNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284460; x=1782889260; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCI1XmtKR5ODmebVbKG33KeFJVLEzf3UXC5d3eUG/2U=;
        b=OtO4xAzM2TWrdK3HrNCSV/s9D7USNHikjwEviIDOaRs3EEfWTUKdtlnZseORe7jxzJ
         b7U8j8z9eZ33EtUOKJa0zcPhPdw27/8j+hTpHoka2QuS/rCVkkPQoR59zhFm8n1Gkor2
         c1BrO18Y4ns8nyKdJZeWOX2Sg6Gh0910mLSCM06NWwuVz6pfnghMBrk3jKQ2neISVFVc
         H4EjstqMnEJCLRmugz6ZtxLAdAXnbls/K9cifQ1pWiI81B0v4Thm97wxmTjLtInfp5jz
         dh0fR3cwcAkYpeF0AZvyRyCzSdWbE3XH304/8Bz3NuAfUHfvmQURM6SoMWbnlWE+zJ9q
         Fm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284460; x=1782889260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCI1XmtKR5ODmebVbKG33KeFJVLEzf3UXC5d3eUG/2U=;
        b=rB4HOeWn1Mk9F2wp7Yns4g/T6q7l+lI+2V2LXdSnApxcPQ4ByxvVg99d74m2H8MC0a
         45Jr0qhSwkniEq0FdRJGkaajxrGkYz5GRjaUGJWlliJJp+IMXUaAF/VUKz+r5ydmHrZR
         Z2hKpKAW1O8v7LK3OyqRTbkWAm0DiUkS6kb2O5VqNluy0Zdj2gS1E5jd1s4NqFCtH8gX
         J8pA4uNojgwuSrEhmuAY64g7BUMMybbbrrmd40Kmbl4m5wc+lUmuXs3YRD5Nf+fwBGLT
         gwO9R0xKqK4y5dOv/gmvi1KEBL5Kyy2xvKIlfVgIufHj1bmsOht2lMmhkf6cAr2IHQfX
         qPYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+G4YTx7f744y/cCcJO6cJwqCTkzK0+Fx7ZNNT9JXKYKx5kh+RVxKfWNKhL0XHZHM6OOE7peAIXZZkPXDkUpg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSU+xBsZwKEwjeUtmCzw8hGKNPTkeksDNdjDhANajH4bCtRLtW
	izwmWg/OIV9e24XOHOGh6hjDubNhU4et6scR1W6oavOYfLi0gjZIcE5VuObecOe5NypKuHc5mKw
	2wioIZ9G22zbcpHJlUxS9f/fQaKpy4IQ=
X-Gm-Gg: AfdE7cnsigVrUWAo54aWguRnxOyVxj6gVpyooqNraXxjZgPvQLTIH3d+UDvI3YWU231
	DIynU62+cJTSulukEq5Tzf3BLjwPxY/hYKlr0qe7XBP6c7kQ7uAhl5kVvCTpN1R6KkaLenx6v//
	OpwQhURxxbAPhsIeHBhr+MVgwCU24KmDlUXZtiVLS9ZeHCG9z3Y8DiNXXVv4S11iIfNzZRVm5di
	i5HRkP20RI8Ma6yDENbUYNvMzoh7YG14Cq4tWpzcWJjEPWj7EX4PR1xFeNOr5TwmPiqFBVX
X-Received: by 2002:a05:6000:230d:b0:446:db72:e8ec with SMTP id
 ffacd0b85a97d-46adabe33e0mr9637981f8f.23.1782284459448; Wed, 24 Jun 2026
 00:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178214588280.2375438.11710758336343332732@maoyixie.com> <ajtwHGY7MaeClHN_@google.com>
In-Reply-To: <ajtwHGY7MaeClHN_@google.com>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Wed, 24 Jun 2026 15:00:48 +0800
X-Gm-Features: AVVi8CfjweMIdZY7GCawgDEH6y8JKhEDIabNxaIWH9uQPRwE7s_rfVsdjjHfpPU
Message-ID: <CAHPEe=FUvt7-C1UZVntUFR5y7rk+=dSOK96UGqK4wOTKTdYoRg@mail.gmail.com>
Subject: Re: platform/chrome: cros_ec_typec: unbounded PD cap count in cros_typec_register_partner_pdos()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

Thanks for confirming it.

> How did you reproduce the overflow?  Was this by modifying the EC firmware
> to send larger counts, or can this be triggered by a non-compliant USB-C
> partner device?

I did not modify the EC firmware and I did not have a real partner. I do
not have cros_ec hardware. I ran the same copy in a small standalone test,
a u32 pdo[7] on the stack with a count above 7, and it tripped the stack
protector. So this is a source review plus that test, not a hardware repro.

I also cannot confirm that a non-compliant partner can push the count past
7. That depends on whether the EC already caps it, which I cannot see. It
may well need buggy or compromised EC firmware. I assumed the partner path
in my mail and I should not have stated it so firmly.

> Generally, the `resp` should be validated immediately after the
> EC_CMD_TYPEC_STATUS command returns in cros_typec_handle_status() and exit
> earlier if the counts are out of bounds.

Makes sense. I will send a patch that does that, with a Fixes tag and Cc
stable.

Thanks,
Maoyi
