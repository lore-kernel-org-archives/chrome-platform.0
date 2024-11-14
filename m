Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9117C20F
	for <chrome-platform@lists.linux.dev>; Thu, 14 Nov 2024 02:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550065; cv=none; b=n1taX52Zh+h6esGByEZVh2M7eXeMY7ykMAO+sEwbtiYSDgZXStLVUJAbuTEgGx9bQXf4yQKWw5wWZULYJHN/Tv/g8YSuTEJ81+i++Rq/9OypRP49WEWMUHf+2ISIWoo2xmKm3F6i1GeQ5LbYjsTze0yUMzKA9MAnfc0suy0YQ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550065; c=relaxed/simple;
	bh=QKyqUYWKyuUV4Yga1Q/6JlhmsEuYWsg6R4MqiOUNbpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Syfxqg0g5PEaXvNDgW2VvkXSwpuLkxePNDijZEWBFFAoFeLNB5f60tjY/byHVo6E06X8m8ScP10t5QX0ARzST3yfJf6tH3mU2PlhxV5NXJUsPjjC3ozCnx67Tx28MLLBkVQ0SgF7Gzm1titGG/bwvW4q9iI6S6xkxF1Ub8g+DG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiC6mNsZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiC6mNsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322F6C4CEC3;
	Thu, 14 Nov 2024 02:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731550064;
	bh=QKyqUYWKyuUV4Yga1Q/6JlhmsEuYWsg6R4MqiOUNbpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiC6mNsZz7DL2t8hDfsfbw6e8ZZEv//I6aIEMHXXXe3TvuWNCr3XzEWvLKgB4FWRq
	 Q1nMy1VCLnZSW4e/HD80uw6yTmb4t1It109g+NzSKd6Q7ZAu6JNJIi+6mNcDO5FuCf
	 2x5EGl6/T/n8Oee8Pb1nd3ZO7WowT9vTfX9I9IUmW3tvALDBHqV9W811ATYIFRCp2h
	 GzfmOUvIe1q/PwAo9BmN/yp3ADXBOZXTO952S+FUNC2DDAvd3THyxGv9SX1wt/9ZPp
	 u3oIcbK9O2pEiTQMUMCA4mrtfdVZQJtkbQ3rQistPwV0T/Nfwf7xj5KvhYtTcgg7An
	 QlD7eknb2lPpQ==
Date: Thu, 14 Nov 2024 02:07:42 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brandon Casey <drafnel@gmail.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: support Google
 Link
Message-ID: <ZzVbbh86elpYQG5s@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com>
 <20241113023800.6263-2-drafnel@gmail.com>
 <ZzRLOmDCOrCa5DJW@google.com>
 <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com>

On Wed, Nov 13, 2024 at 02:44:55AM -0600, Brandon Casey wrote:
> 
> 
> On November 13, 2024 12:46:18 AM CST, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >On Tue, Nov 12, 2024 at 08:29:05PM -0600, Brandon Casey wrote:
> >> On the Google Pixel chromebook (aka Google Link), the keyboard led
> >> backlight has the ACPI device id "GGL0002".  Let's add it to the
> >> configuration array.
> >
> >Why it can't be matched by "GOOG0002"? [1] 
> 
> I'm not sure I understand this question. On my device the backlight has ACPI id "GGL0002", not "GOOG0002"?
> 
> >Have you tried to update your AP firmware?
> 
> I have not explicitly updated any firmware. It has whatever firmware Chromeos has installed.

IIUC, if your AP firmware includes patch [1] (submitted in 2015), it should
report "GOOG0002" instead of "GGL0002".

[1]: https://review.coreboot.org/c/coreboot/+/11478
