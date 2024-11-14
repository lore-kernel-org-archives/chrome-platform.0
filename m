Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F21E8822
	for <chrome-platform@lists.linux.dev>; Thu, 14 Nov 2024 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574430; cv=none; b=DaM2ECTXcuaO46jqR8SEfN5vMLGb0iT6k0q7h4YySJwUWKI5+YQHVPepLXQZCU1AfidKM2kk9Y0CRKjH4IW8P6PbuWSOq4hq5Voae63DJ3Z/IiXk1EshSakgFScuSelbwj99oWMLE3Bwi+XSgy4iAOfN9HNDAou8J9rhnAcoIGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574430; c=relaxed/simple;
	bh=5qnoDCgeNMkRmg3jf1MJZSKsVoa+jcGxRuaDBMi1it4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVKUYeG4VTJYDQVb8EqmijCNWiLgKDosUUjfP22k7O53ffNysQiJcPTOKq9CzRzfrY4UNHfV0V5FgYP5wBGdbxz9zGIVr8HB7zFWLP6B8uOWbGDA+sP88QepJq4up4HbU1F65zhQyoWzUOFlId1vliCj7oMe1fVwCjJgRFxYiVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFE5A4tx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFE5A4tx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2246FC4CECD;
	Thu, 14 Nov 2024 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731574429;
	bh=5qnoDCgeNMkRmg3jf1MJZSKsVoa+jcGxRuaDBMi1it4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFE5A4tx5wMi1VZa8n0fCWxdlbiw21jnyT24XNRyovbVLsEdCMM9bovKLiz/fagbz
	 reAstIkVdfgI9A9Y5opqKw/mRI7oLIDdTpUkSfxOXvuQChxfLt7JEgRWk5GWrK1YwH
	 tk4dD6t7wtO3KAKVgo5Z5BBRNFhIcZ0KSpacVwVjDFC7QTYxZzmBhnTnyVIgxqOo3l
	 00TuRZTSzOZ++TIn5eWv/MGeZwd9YMmU2EdYW9nxDbHj/Dx5fqC1I1iX1LpL+w3YN5
	 ORccaHmAPWaAq1xxb0avQfhQI5I+Vbj/styeznzgI1EakXYYx0kPHWhgLLdw/kEjL4
	 22j4Bk0YnWXVg==
Date: Thu, 14 Nov 2024 08:53:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brandon Casey <drafnel@gmail.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_kbd_led_backlight: support Google
 Link
Message-ID: <ZzW6mz9TGc8bglOi@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com>
 <20241113023800.6263-2-drafnel@gmail.com>
 <ZzRLOmDCOrCa5DJW@google.com>
 <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com>
 <ZzVbbh86elpYQG5s@google.com>
 <439FC80F-141E-438A-B201-772C9509D048@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <439FC80F-141E-438A-B201-772C9509D048@gmail.com>

On Wed, Nov 13, 2024 at 10:38:36PM -0600, Brandon Casey wrote:
> 
> 
> On November 13, 2024 8:07:42 PM CST, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >On Wed, Nov 13, 2024 at 02:44:55AM -0600, Brandon Casey wrote:
> >> 
> >> 
> >> On November 13, 2024 12:46:18 AM CST, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >> >On Tue, Nov 12, 2024 at 08:29:05PM -0600, Brandon Casey wrote:
> >> >> On the Google Pixel chromebook (aka Google Link), the keyboard led
> >> >> backlight has the ACPI device id "GGL0002".  Let's add it to the
> >> >> configuration array.
> >> >
> >> >Why it can't be matched by "GOOG0002"? [1] 
> >> 
> >> I'm not sure I understand this question. On my device the backlight has ACPI id "GGL0002", not "GOOG0002"?
> >> 
> >> >Have you tried to update your AP firmware?
> >> 
> >> I have not explicitly updated any firmware. It has whatever firmware Chromeos has installed.
> >
> >IIUC, if your AP firmware includes patch [1] (submitted in 2015), it should
> >report "GOOG0002" instead of "GGL0002".
> >
> >[1]: https://review.coreboot.org/c/coreboot/+/11478
> 
> I can only assume that Google did not ever ship a firmware update for Link that included that patch. I believe this device has all ChromeOS updates applied, so it represents a stock system, though no longer supported, and aside from being in developer mode and having a Linux partition.

Please try to wrap your message to fit to 80-column.  See [2].

[2]: https://people.kernel.org/tglx/notes-about-netiquette

> My firmware also reports the acpi device as GGL0001.
> 
>     $ cat /sys/bus/acpi/devices/GGL000*/hid
>     GGL0001
>     GGL0002
> 
>     $ cat /sys/bus/acpi/devices/GGL000*/path
>     \CRHW
>     \_SB_.KBLT
> 
> Is there any reason why we shouldn't do the same thing here for the keyboard backlight that was done in drivers/platform/chrome/chromeos_acpi.c and support both the legacy ID and the official ACPI ID? I see your commit 703e77134 which added GOOG0016 in addition to GGL0001.

- The most important reason: "GGL0002" is assigned to other purpose.
- For some reason, your machine is using a quite old firmware.  It makes
  less sense to me for supporting a should-be-deprecated PNP ID by [1].
- The case is different from 703e77134.  We prefer HID to PNP ID.
