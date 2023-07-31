Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA92363
	for <chrome-platform@lists.linux.dev>; Mon, 31 Jul 2023 02:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6F5C433C7;
	Mon, 31 Jul 2023 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690771815;
	bh=9F83NESB3MsIpi/NJyZ5owEqyRAMOlnpJSpxuAARug0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMx0jp3PfWAAB7+N1nsNtQ49L4iExn3escATkicUDxxD54IL76Gmk/hI4VKCE4mUi
	 h0YtOkMltRG9YVC41m7IaAMuNpo6VqXP35GeiIkBq0/GhjCKkAwBWTwgDJX+hkRFsQ
	 wNF27kljoi7s8gNCE+JlIweTgckCLaQM55UKSBv5Lhk9x/KouNtOx2NgVQpmveXRGl
	 m+CUFmZ5Cz1rUsvq3CCHkZxBtIcKjk//V0MBAuX3EwJbR8/pJNXtkHjBrYFK3/hrmz
	 RMn+VwjJOTzpGUzQ+vNsJBENzSKEX9yFPND1S9AJgkRb8Eh2uT5yXwY02aOFOPUpGl
	 hhsvHsHhsQZGQ==
Date: Mon, 31 Jul 2023 10:50:11 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: rafael@kernel.org, lenb@kernel.org, bleung@chromium.org,
	groeck@chromium.org, chrome-platform@lists.linux.dev,
	linux-acpi@vger.kernel.org, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: support official HID
 GOOG0016
Message-ID: <ZMchYw19KmfcChGK@google.com>
References: <20230728065438.4026629-1-tzungbi@kernel.org>
 <CABXOdTca9hmjWXNATeSkhZAV1PXh1ppt6ENEV23xUpO86ogu_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXOdTca9hmjWXNATeSkhZAV1PXh1ppt6ENEV23xUpO86ogu_w@mail.gmail.com>

On Fri, Jul 28, 2023 at 08:03:50AM -0700, Guenter Roeck wrote:
> On Thu, Jul 27, 2023 at 11:55 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > --- a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> > +++ b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> > @@ -1,4 +1,4 @@
> > -What:          /sys/bus/platform/devices/GGL0001:*/BINF.2
> > +What:          /sys/bus/platform/devices/GOOG0016:*/BINF.2
> 
> Doesn't the description mean that both sysfs directories might be seen
> in the field ?
> If so, replacing one with the other would be wrong.

Fix it in v3
(https://patchwork.kernel.org/project/chrome-platform/patch/20230731024214.908235-1-tzungbi@kernel.org/)
by appending a new line for "GOOG0016".
