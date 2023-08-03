Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC41847
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 04:17:30 +0000 (UTC)
Received: from [192.168.100.7] (unknown [39.34.184.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0EC6F660036A;
	Thu,  3 Aug 2023 05:17:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691036248;
	bh=Sfvq7Gd6D8mgT2MZqVZdYSImOrsmyHDlwRoCyElcdyg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IZgAx/99UZaV+tDa36NGiRdqSlLw9qdR51pqcRyH6/+sIACerqJZ9HAQgi8ITgK1p
	 2gQvDhGHAlsJrQULw0U1Zi7ha1g9cqVRJseoipOCljfxdM14iR5dwZ5Ai9E55MX2+c
	 yWkrPzTc1eW24Up4nPOYD0RUmWRaVnm0P325q8Z72hE+hSeJQ6GhDuX0bJhB4uAkkj
	 cKIHG5BT5plFLwnTgYrzBoHK3U3g3dMh+ZgBzU3js70WVgIXloNS6XUFXkoLZ2T9dG
	 jl6ArB+64uMfAZhNxHmceOSza6O9/qYCoRODrtOyVbMGo/dnhaXhHQ4cFc/G9TISio
	 6fPzyejnrsTLA==
Message-ID: <f4ae9de4-7b05-a797-087e-d895f7333167@collabora.com>
Date: Thu, 3 Aug 2023 09:17:23 +0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, bleung@chromium.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev,
 guillaume.tucker@collabora.com, denys.f@collabora.com,
 ricardo.canuelo@collabora.com, briannorris@chromium.org
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Content-Language: en-US
To: Tzung-Bi Shih <tzungbi@kernel.org>
References: <20230802095736.3079963-1-tzungbi@kernel.org>
 <1be7888e-2346-99b1-4c31-f755fcbd054a@collabora.com>
 <ZMsBpMDK5iXwFa+S@google.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <ZMsBpMDK5iXwFa+S@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/3/23 6:23 AM, Tzung-Bi Shih wrote:
> On Wed, Aug 02, 2023 at 08:15:31PM +0500, Muhammad Usama Anjum wrote:
>> On 8/2/23 2:57 PM, Tzung-Bi Shih wrote:
>>> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
>>> perfect for them.
>>>
>>> Print hex string for ACPI_TYPE_BUFFER.
>>>
>>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
>> Please add fixes tag and CC stable as well (stable@vger.kernel.org) in next
>> revision.
>>
>> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> 
> I think a Fixes tag should be sufficient.
Why do you think so? As this is a bug fix which exists in the driver since
it was written, if we add fixes tag and probably cc stable as well, the
patch will be applied to all LTS kernels which we really want. In this way,
the bug would be fixed on all LTS kernels not just the latest kernel.

> 
> Fix in v3 (https://patchwork.kernel.org/project/chrome-platform/patch/20230803011245.3773756-1-tzungbi@kernel.org/).

-- 
BR,
Muhammad Usama Anjum
